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
			
			while(isLiteral(c) == 1){
				c = buf[i+1];
				i++;
				
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
					tokenBuff[offset] = WRITE;
					offset++;
					break;
					
				case INST_HELP:
					tokenBuff[offset] = HELP;
					offset++;
					break;
					
				case 0x20:
					//space bar
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

void evaluateStmt(char * buf){
	
	unsigned char tokenBuff[128];
	
	print("\n\r");
	print(buf);
	print("\n\r");
	
	char tokenRet = tokenizeBuffer(buf, &tokenBuff);
	
	if(tokenRet != 0){
		print("\n\rError, Unrecognized character : ");
		putc(tokenRet);
		print("\n\r");
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
	
	getStr(buf);
	evaluateStmt(buf);
	
}