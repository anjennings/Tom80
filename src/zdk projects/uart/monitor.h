#ifndef MONITOR_H_
#define MONITOR_H_

#include "uart.h"
#include "tom80.h"
#include <stdlib.h>

enum parser_token{
	EOF,
	READ,
	WRITE,
	EXECUTE,
	WORD,
	NIBBLE,
	HELP
} parser_token;

#define INST_READ ':'
#define INST_WRITE '<'
#define INST_EXECUTE '@'
#define INST_HELP '?'

char tokenizeBuffer(char * buf, char * tokenBuff);
int executeBuffer(char * tokenBuff);
void evaluateStmt(char * buf);
void monitor_help();
void monitor_execute(int addr);
void monitor_word(char * buf);
int isLiteral(char c);
int isHex(char c);
int isNumerical(char c);
void monitor(char * buf);

#endif