defc heap_loc = 0x8000  ;; the heap's location in memory
defc heap_sz  = 4096    ;; the heap's size in bytes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION HEAP
org heap_loc

__malloc_block:  defs heap_sz

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION data_user
PUBLIC __malloc_heap

__malloc_heap:   defw __malloc_block

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION code_crt_init

; initialize the heap in the crt

   ld hl,__malloc_block
   ld bc,heap_sz
   
   EXTERN asm_heap_init
   call asm_heap_init

; note no "ret" here as this section falls
; into the code calling main()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;