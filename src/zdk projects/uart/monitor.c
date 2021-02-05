#include "monitor.h"

char tokenizeBuffer(char * buf, char * tokenBuff){
	
	char c;
	int offset = 0;
	uint16_t litValue = 0;
	
	for(int i = 0; buf[i] != '\0'; i++){
		
		c = buf[i];
		
		//Special Case, handle literals
		//TODO: Make this its own function and incorporate into the switch statement
		if(isLiteral(c) == 1){
			
			//convert first literal
			if(isHex(c)){
				litValue = ((uint16_t)c) - 0x37;
			}else{
				litValue = ((uint16_t)c) - 0x30;
			}
			
			tokenBuff[offset] = WORD;
			offset++;
			
			while(isLiteral(buf[i+1]) == 1){
				i++;
				c = buf[i];
				
				if(isHex(c)){
					litValue = (litValue<<4) | (0xF & (((uint16_t)c) - 0x37));
				}else{
					litValue = (litValue<<4) | (0xF & (((uint16_t)c) - 0x30));
				}
			}
			tokenBuff[offset] = (char)((litValue&0xFF00)>>8);
			offset++;
			tokenBuff[offset] = (char)(litValue&0xFF);
			offset++;
			
		}else{
		
			switch(c){
				case INST_READ:
					tokenBuff[offset] = READ;
					offset++;
					break;
				
				case INST_WRITE:
					tokenBuff[offset] = WRITE;
					offset++;
					break;
					
				case INST_EXECUTE:
					tokenBuff[offset] = EXECUTE;
					offset++;
					break;
					
				case INST_HELP:
					tokenBuff[offset] = HELP;
					offset++;
					break;
					
				case 0x20:
					//space bar
					break;
					
				case '\r':
				case '\n':
					tokenBuff[offset] = EOF;
					return 0;
					break;
					
				default:
					//return the offending character
					return c;
					break;
			}
			
		}
	}
	
	return 0;
	
}

int executeBuffer(char * buf) {
	
	//TODO, make a proper look ahead table
	int offset = 0;
	uint16_t lit1, lit2;
	uint8_t instruction;
	
	switch(buf[offset]){
		case HELP:
			monitor_help();
			return 0;
			break;
			
		case EXECUTE:
			monitor_execute(buf[offset+2]);
			return 0;
			break;
			
		case WORD:
			monitor_word(buf);
			return 0;
			break;
			
		default:
			return 0;
			break;
	}
	
	return 0;
}

void evaluateStmt(char * buf) {
	
	unsigned char tokenBuff[128];
	
	//print("\n\r");
	//print(buf);
	print("\n\r");
	
	char tokenRet = tokenizeBuffer(buf, &tokenBuff);
	
	if (tokenRet != 0) {
		print("\n\rError, Unrecognized character : ");
		putc(tokenRet);
		print("\n\r");
		return;
	}
	
	if (executeBuffer(&tokenBuff) != 0) {
		print("\n\rError, Invalid syntax\n\r");
	}
	
}

void monitor_help(){
	print("\n\rINSTRUCTIONS : ");
	print("\n\r1FFF : 10 - READ 16 BYTES STARTING AT LOCATION 0x1FFF");
	print("\n\r1FFF < 10 - WRITE 0x10 TO LOCAITON 0x1FFF");
	print("\n\r@1FFF - BEGIN EXECUTION AT LOCATION 0x1FFF");
	print("\n\r? - DISPLAY HELP MESSAGE");
	print("\n\n\r");
}

void monitor_execute(int addr){
	print("\n\rExecute code goes here\n\r");
}

void monitor_word(char * buf){
	
	uint16_t lit1;
	uint8_t lit2;
	uint8_t instruction;
	
	//lazy, non LL(1) way of doing things
	lit1 = buf[1];
	lit1 = lit1<<8;
	lit1 = lit1 | buf[2];
			
	instruction = buf[3];
			
	lit2 = buf[6];
	
	if (instruction == READ) {
		print("\n\rREAD!\n\r");
	} else if (instruction == WRITE) {
		print("\n\rWRITE!\n\r");
	} else {
		print("\n\rinvalid instruction\n\r");
	}
}

int isLiteral(char c){
	return isHex(c) | isNumerical(c);
}

//TODO: convert to macro?
int isHex(char c){
	return (((int)c >= 0x41) & ((int)c <= 0x46));
}

int isNumerical(char c){
	return (((int)c >= 0x30) & ((int)c <= 0x39));
}

void monitor(char * buf){
	
	print("[Tom80]:~$ ");
	getStr(buf);
	evaluateStmt(buf);
	
}