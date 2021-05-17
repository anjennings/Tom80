#ifndef BLACKJACK_H_
#define BLACKJACK_H_

#include <stdlib.h>
#include <string.h>
#include "uart.h"
#include <malloc.h>
#include "tom80.h"

typedef enum {
	FOLD = 0,
	BET,
	HIT,
	STAY
}playerAction;

typedef struct card {
	
	char id[3];
	int value;
	int isAce;
	int delt;
	
} Card;

typedef struct deck {
	
	Card cards[52];
	
} Deck;

typedef struct player {
	
	Card cards[10];
	int numCards;
	int chips;
	int currentBet;
	int wins;
	int losses;
	int busted;
	int standing;
	int isDealer;
	
} Player;

typedef struct table {
	
	Deck *deck;
	Player *players[2];
	
} Table;

//	General Functions
void blackJack();
void blackJackInit(Table *t);
void playGame(Table *t);

//Table Functions
void roundStart(Table *t);
void roundMiddle(Table *t);
void roundEnd(Table *t);

//Deck Functions
void dealCard(Deck *deck, Player *p);

//Dealer AI Functions
void dealerTurn(Player *p, Deck *d);

//	Player Functions
int getPlayerScore(Player *p);
int isPlayerBusted(Player *p);
void playerWin(Player *p);
void playerLose(Player *p);
int playerDecreaseBet(Player *p, unsigned int bet);
int playerIncreaseBet(Player *p, unsigned int bet);
int playerInput();
void playerTurn(Player *p, Deck *d);
void playerStand(Player *p);
void printPlayerStats(Table *t);

#endif	//blackjack.h