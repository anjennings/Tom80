
;Memory allocation program

;Things to know
;All blocks are byte aligned by 2
;Since the size values are only 15 bits, 16 bit subtraction can be done manually -> X + (NOT(Y)+1)
;   via 2's compliment with the 16th bit being used as the sign

;Block Anatomy:
;2 Byte Header - a/f bit, 15 bit size
;Payload (max 32k, although it will never be that large)
;2 Byte Footer - size only

;///////////////////////////////////////////////
;Ram locations exclusive to the heap
HEAPRAM EQU 0x8F00
HEAP_INITIALIZED EQU 0x8F00
LASTBLOCK_PTR EQU 0x8F02

;Locations used by alloc
ALLOC_SIZE_REQ EQU 0x8F14
ALLOC_CUR_HEAD EQU 0x8F16
ALLOC_START_PT EQU 0x8F18

;Locations used by trim
TRIM_START_PTR EQU 0x8F30
TRIM_REQ_AMNT EQU 0x8F32
TRIM_START_AMT EQU 0x8F34
TRIM_NEW_PTR EQU 0x8F36

;Locations used by merge
MERGE_START_PTR EQU 0x8F30
MERGE_REQ_AMNT EQU 0x8F32
;///////////////////////////////////////////////

;///////////////////////////////////////////////
;Completely arbitrary, first 4k is used for other kernel stuff
HEAPSTART EQU 0x9000
HEAPSIZE EQU 0x1000 ;4k, Ideally this can change with no effect on code
HEAPEND EQU (HEAPSTART + HEAPSIZE)
;///////////////////////////////////////////////

org 0x0000
MAIN:
        LD HL, 0x0000
        LD SP, HL
        
        CALL TEST03
        
        HALT
        

TEST01:
        CALL heapInit
        LD HL, 4
        CALL alloc
        LD DE, HL
        LD HL, 9
        CALL alloc
        CALL free
        LD HL, DE
        CALL free
        RET


TEST02:
        CALL heapInit
        LD HL, 1000
        CALL alloc
        LD BC, HL
        LD HL, 64
        CALL alloc
        LD DE, HL
        LD HL, 300
        CALL alloc
        EX DE, HL
        CALL free
        LD HL, 10
        CALL alloc
        RET
    
TEST03:
        CALL heapInit
        
        LD HL, 10
        CALL alloc
        PUSH HL
        
        LD HL, 20
        CALL alloc
        PUSH HL
        
        LD HL, 30
        CALL alloc
        
        CALL free
        
        POP HL
        CALL free
        
        POP HL
        CALL free
        
        RET
;///////////////////////////////////////////////
;Functions
;///////////////////////////////////////////////



;//////////////////////////////////////
;Heap Init
;Initilize the heap, should only be run once
;//////////////////////////////////////
heapInit:
        PUSH DE
        PUSH HL

        ;Set Lastblock pointer to the start of the heap
        LD HL, LASTBLOCK_PTR        
        LD DE, HEAPSTART
        LD A, D
        LD (HL), A
        INC HL
        LD A, E
        LD (HL), A
        
        ;Get set up head of the first block with the size
        LD HL, HEAPSTART
        LD DE, HEAPSIZE
        LD (HL), D
        INC HL
        LD (HL), E
        
        ;Set the foot of the first block as well
        LD HL, HEAPSTART
        LD DE, HEAPSIZE
        ADD HL, DE
        DEC HL
        LD (HL), E
        DEC HL
        LD (HL), D
        
        ;Return 0 for success
        LD A, 0

        heapInit_exit:
        POP HL
        POP DE
        RET
    
    
;//////////////////////////////////////
;Alloc
;Request a heap block of a given size
;Expects:
;   -HL to be a block size
;Returns:
;   -Pointer in HL on success
;       if HL is NULL then failure
;//////////////////////////////////////
alloc:
        PUSH BC
        PUSH DE
        
    alloc_size_check:
        ;Take size in HL and add 4 for headers and 1 for padding if needed
        LD BC, 4
        ADD HL, BC
        LD A, L
        AND 1
        CP 1
        JP C, alloc_save_request
        INC HL
        
    alloc_save_request:
        ;Save the requested size to ram
        LD A, H
        LD (ALLOC_SIZE_REQ), A
        LD A, L
        LD (ALLOC_SIZE_REQ+1), A
        
    alloc_set_start:
        ;Set the starting point
        LD A, (LASTBLOCK_PTR)
        LD (ALLOC_START_PT), A
        LD B, A
        LD A, (LASTBLOCK_PTR+1)
        LD (ALLOC_START_PT), A
        LD C, A
        
    ;Loop starts here 
    alloc_find_loop: 
        ;Get the pointer to the last block in BC
        LD A, (LASTBLOCK_PTR)
        LD B, A
        LD A, (LASTBLOCK_PTR+1)
        LD C, A
        
        ;Get the header of the last block in DE
        LD A, (BC)
        LD D, A
        INC BC
        LD A, (BC)
        LD E, A
        
        ;Save Header to ram
        LD A, D
        LD (ALLOC_CUR_HEAD), A
        LD A, E
        LD (ALLOC_CUR_HEAD+1), A
        
        ;Check the free bit
        LD A, D
        AND 0x80
        CP 0
        JP NZ, alloc_find_next
        
        ;The block is free, but is it large enough?
        
        ;Get the requested size back into HL
        LD A, (ALLOC_SIZE_REQ)
        LD H, A
        LD A, (ALLOC_SIZE_REQ+1)
        LD L, A
        
        ;Compare high byte
        LD A, D
        AND 0x7F
        CP H
        JP C, alloc_find_merge      ;H > D, try merge
        JP NZ, alloc_find_current   ;D > H, use this block 
        
        ;Compare low byte since D == H
        LD A, E
        CP L
        JP C, alloc_find_merge      ;L > E, try merge
                                    ;E > L, that means current block works
        
        ;If merge fails, go right to alloc_find_next
    
    alloc_find_current:
        ;The block pointed to by LASTBLOCK_PTR is free but is big enough
        
        ;Set DE to current Block
        LD A, (LASTBLOCK_PTR)
        LD D, A
        LD A, (LASTBLOCK_PTR+1)
        LD E, A
        
        ;Set HL to requested size
        LD A, (ALLOC_SIZE_REQ)
        LD H, A
        LD A, (ALLOC_SIZE_REQ+1)
        LD L, A
        
        ;Trim the current block to the requested size
        CALL trim
        CP 0
        JP Z, alloc_success
        JP alloc_fail
        
    alloc_find_merge:
        ;The block pointed to by LASTBLOCK_PTR is free but is too small, try merge
        
        ;Set DE to current Block
        LD A, (LASTBLOCK_PTR)
        LD D, A
        LD A, (LASTBLOCK_PTR+1)
        LD E, A
        
        ;Set HL to requested size
        LD A, (ALLOC_SIZE_REQ)
        LD H, A
        LD A, (ALLOC_SIZE_REQ+1)
        LD L, A
        
        ;Call merge and attempt to create a block of the requested size
        CALL merge
        CP 0
        JP Z, alloc_success
        ;If unsuccessful, go to next block
    
    alloc_find_next:
        ;The block pointed to at LASTBLOCK_PTR is allocated or is too small, jump to next block
        
        ;Set DE to current Block
        LD A, (LASTBLOCK_PTR)
        LD D, A
        LD A, (LASTBLOCK_PTR+1)
        LD E, A
        
        ;Get header (may have been updated)
        LD A, (DE)
        LD H, A
        INC DE
        LD A, (DE)
        LD L, A
        DEC DE
        
        ;Get size of current block
        LD A, H
        AND 0x7F
        LD H, A
        
        ;Jump to next block (now pointed to by HL)
        ADD HL, DE
        
        ;Save new block for next iteration
        LD A, H
        LD (LASTBLOCK_PTR), A
        LD A, L
        LD (LASTBLOCK_PTR+1), A
        
        ;Check the starting point
        LD A, (ALLOC_START_PT)
        LD D, A
        LD A, (Alloc_START_PT+1)
        LD E, A
        
        ;Todo: compare HL and DE to see if the entire heap has been checked
        ;Todo: alternatively, just always start at the begining of the heap
        
        JP alloc_find_loop
    ;Loop ends here  
    alloc_success:
        ;Set set the alloc bit
        LD A, (HL)
        OR 0x80
        LD (HL), A
        ;Point the user to the payload, not the header
        INC HL
        INC HL
        JP alloc_end
    
    alloc_fail:
        LD HL, 0
        
    alloc_end:
        POP DE
        POP BC
        RET
        

;//////////////////////////////////////
;Free
;Free up an allocated block
;Will attempt to merge with any proceeding blocks
;Expects:
;   -HL to be a pointer to an allocated block
;Returns:
;   -0 if successful
;//////////////////////////////////////
free:
        PUSH BC
        PUSH DE
    free_start:
        ;Pointer is to start of payload, not header
        DEC HL
        DEC HL
        
        ;Check that pointer is 2 byte aligned
        LD A, L
        AND 1
        CP 1
        JP Z, free_fail
        
        ;Clear alloc bit
        LD A, (HL)
        AND 0x7F
        LD (HL), A
        
        ;Put pointer into DE
        EX DE, HL
        
        ;If size is 0, merge will always be successful
        LD HL, 0
        
        CALL merge
        CP 0
        JP Z, free_exit
        
    free_fail:
        LD A, 0xFF
        JP free_exit
        
    free_exit:
        POP DE
        POP BC
        RET
        

;//////////////////////////////////////
;Trim Block
;Given the pointer to an empty block and the desired size, trim the block to be that size
;Expects:
;   -HL is the desired size
;   -DE is the pointer to the empty block
;Returns:
;   -0 in A if successful
;   -HL is pointer to block of requested size
;//////////////////////////////////////
trim:
        PUSH BC
        PUSH DE
        
    ;TODO: check if HL is divisible by 2?
        
    trim_save_ptr:
        ;Save Pointer to first block
        LD A, D
        LD (TRIM_START_PTR), A
        LD A, E
        LD (TRIM_START_PTR+1), A
        
    trim_save_req_size:
        ;Save requested size
        LD A, H
        LD (TRIM_REQ_AMNT), A
        LD A, L
        LD (TRIM_REQ_AMNT+1), A
        
    trim_save_old_size:
        ;Save original size of block
        LD A, (DE)
        LD (TRIM_START_AMT), A
        INC DE
        LD A, (DE)
        LD (TRIM_START_AMT+1), A
        DEC DE
        
    trim_check_free:
        ;Check that first block is empty
        LD A, (DE)
        AND 0x80
        CP 0x80
        JP Z, trim_fail
        
    trim_check_size:
        ;Get the header in BC
        LD A, (DE)
        LD B, A
        INC DE
        LD A, (DE)
        LD C, A
        DEC DE
        
        ;Save the pointer in HL
        LD HL, DE
        
        ;Get the requested amount in HL
        LD A, (TRIM_REQ_AMNT)
        LD H, A
        LD A, (TRIM_REQ_AMNT+1)
        LD L, A
        
        ;Now that the block size is in BC and the requested amount is in HL
        ;Compare High bytes
        LD A, B
        AND 0x7F
        CP H
        JP C, trim_fail             ;Request > Block, fail
        JP NZ, trim_use_current     ;Block > Request, its good
        
        ;Compare low byte since Request == Block
        LD A, C
        CP L
        JP C, trim_fail      ;Request > Block, fail
                                    ;Block => Request, its good
    trim_use_current:
    
    trim_head_old:
        ;Change current block header
        LD A, (TRIM_START_PTR)
        LD D, A
        LD A, (TRIM_START_PTR+1)
        LD E, A
        
        LD A, (TRIM_REQ_AMNT)
        LD (DE), A
        INC DE
        LD A, (TRIM_REQ_AMNT+1)
        LD (DE), A
        DEC DE
        
    trim_foot_old:
        ;Go to new footer
        LD A, (TRIM_REQ_AMNT)
        LD H, A
        LD A, (TRIM_REQ_AMNT+1)
        LD L, A
        
        
        ADD HL, DE
        DEC HL
        DEC HL
        
        ;Change current block footer
        LD A, (TRIM_REQ_AMNT)
        LD (HL), A
        INC HL
        LD A, (TRIM_REQ_AMNT+1)
        LD (HL), A
        DEC HL
        
        ;Save pointer to new block in BC
        LD BC, HL
        INC BC
        INC BC
        
        
        ;Now calculate the size of the remaining block
    
    trim_new_size:    
        ;Put og size into HL
        LD A, (TRIM_START_AMT)
        LD H, A
        LD A, (TRIM_START_AMT+1)
        LD L, A
        
        ;Put requested size into DE
        LD A, (TRIM_REQ_AMNT)
        LD D, A
        LD A, (TRIM_REQ_AMNT+1)
        LD E, A
        
        ;Subtract DE from HL, HL = (HL + (NOT(DE)+1))
        LD A, D
        XOR 0xFF
        LD D, A
        LD A, E
        XOR 0xFF
        LD E, A
        INC DE
        ADD HL, DE
        
        ;Save new size in DE
        LD DE, HL
      
    trim_head_new:  
        ;Now put the new size into the new header pointed to by BC
        LD A, H
        LD (BC), A
        INC BC
        LD A, L
        LD (BC), A
        DEC BC
        
    trim_foot_new:
        ;go to the footer of the new block (now pointed to by HL)
        ADD HL, BC
        DEC HL
        DEC HL
        LD A, D
        LD (HL), A
        INC HL
        LD A, E
        LD (HL), A
        
        ;Now the blocks should be split
    trim_success:
        LD A, (TRIM_START_PTR)
        LD H, A
        LD A, (TRIM_START_PTR+1)
        LD L, A
        
        LD A, 0
        JP trim_exit
        
    trim_fail:
        LD A, 0xFF
        
    trim_exit:
        POP BC
        POP DE
        RET
    
    
;//////////////////////////////////////
;Merge Block
;Given the pointer to an empty block try to merge it with surrounding empty blocks
;Expects:
;   -HL is the desired size
;   -DE is the pointer to the empty block
;Returns:
;   -0 in A if successful
;   -HL is pointer to block of requested size
;//////////////////////////////////////
merge:
        PUSH BC
        PUSH DE
        
    merge_save_ptr:
        ;Save Pointer to first block
        LD A, D
        LD (MERGE_START_PTR), A
        LD A, E
        LD (MERGE_START_PTR+1), A
        
    merge_save_size:
        ;Save requested size
        LD A, H
        LD (MERGE_REQ_AMNT), A
        LD A, L
        LD (MERGE_REQ_AMNT+1), A
        
        ;I made a mistake
        EX DE, HL
        
    merge_check_first:
        ;Check that first block is empty
        LD A, (HL)
        AND 0x80
        CP 0x80
        JP Z, merge_fail
        
        ;Put first block header in DE
        LD A, (HL)
        LD D, A
        INC HL
        LD A, (HL)
        LD E, A
        DEC HL
        
        ;Go to next block (now pointed to by HL) 
        ADD HL, DE
        
    ;Loop begins here
    merge_loop_start:
    
    merge_loop_bounds:
        ;Check that this block is not outside the heap
        ;HL - HEAPEND should be less than 0
        PUSH HL
        PUSH DE
        
        ;Get end of heap address in BC
        LD BC, HEAPEND
        ;Negate and + 1
        LD A, B
        XOR 0xFF
        LD B, A
        LD A, C
        XOR 0xFF
        LD C, A
        INC BC
        
        ;Current Block Pointer - End of Heap
        ADD HL, BC
        
        ;Check if negative
        LD A, H
        
        POP DE
        POP HL
        
        AND 0x80
        CP 0
        JP Z, merge_loop_end
    
    merge_loop_status:
        ;Check that this new block is empty
        LD A, (HL)
        AND 0x80
        CP 0x80
        JP Z, merge_loop_end
        
        ;Get size of the block in DE
        LD A, (HL)
        LD D, A
        INC HL
        LD A, (HL)
        LD E, A
        DEC HL
        
        ;Get pointer to first block in BC
        LD A, (MERGE_START_PTR)
        LD B, A
        LD A, (MERGE_START_PTR+1)
        LD C, A
        
        ;Get the size of the old header in HL
        LD A, (BC)
        LD H, A
        INC BC
        LD A, (BC)
        LD L, A
        DEC BC
        
        ;Sum the old and new block sizes and store into DE
        ADD HL, DE
        LD DE, HL
        
        ;Update Header
        LD A, H
        LD (BC), A
        INC BC
        LD A, L
        LD (BC), A
        DEC BC
        
        ;Get pointer to footer (into HL)
        ADD HL, BC
        DEC HL
        DEC HL
        
        ;Update footer
        LD A, D
        LD (HL), A
        INC HL
        LD A, E
        LD (HL), A
        INC HL
        
        ;HL should now point to the next, unchecked block
        JP merge_loop_start
        
    ;Loop ends here   
    merge_loop_end:
        ;see if new block is large enough
        
        ;Get original block pointer in DE
        LD A, (MERGE_START_PTR)
        LD D, A
        LD A, (MERGE_START_PTR+1)
        LD E, A
        
        ;Get the header of the first block in BC
        LD A, (DE)
        LD B, A
        INC DE
        LD A, (DE)
        LD C, A
        DEC DE
        
        ;Get the requested size in HL
        LD A, (MERGE_REQ_AMNT)
        LD H, A
        LD A, (MERGE_REQ_AMNT+1)
        LD L, A
        
        ;Subtract HL from BC,  HL = (BC + (NOT(HL)+1))
        LD A, H
        XOR 0xFF
        LD H, A
        LD A, L
        XOR 0xFF
        LD L, A
        INC HL
        ADD HL, BC
        
        ;See if sign bit is set
        LD A, H
        AND 0x80
        CP 0x80
        JP NZ, merge_success
    
    merge_fail:
        LD A, 0xFF
        JP merge_exit
        
    merge_success:
        ;Set return values
        LD A, (MERGE_START_PTR)
        LD H, A
        LD A, (MERGE_START_PTR+1)
        LD L, A
        LD A, 0
  
    merge_exit:  
        POP DE
        POP BC
        RET
        
        