#ifndef TOM80_H_
#define TOM80_H_

#include <stdlib.h>
#include <string.h>
#include "uart.h"
#include <malloc.h>

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
	int isDealer;
	
} Player;

typedef struct table {
	
	Deck *deck;
	Player *players[2];
	
} Table;

//TODO: Make a table struct with an array of all players and the deck?

Card Ace = {"A", 1, 1, 0 };
const Card Two = {"2", 2, 0, 0 };
const Card Three = {"3", 3, 0, 0 };
const Card Four = {"4", 4, 0, 0 };
const Card Five = {"5", 5, 0, 0 };
const Card Six = {"6", 6, 0, 0 };
const Card Seven = {"7", 7, 0, 0 };
const Card Eight = {"8", 8, 0, 0 };
const Card Nine = {"9", 9, 0, 0 };
const Card Ten = {"10", 10, 0, 0 };
const Card Jack = {"J", 10, 0, 0 };
const Card Queen = {"Q", 10, 0, 0 };
const Card King = {"K", 10, 0, 0 };

int types[13];

//	General Functions
void blackJack();
void blackJackInit(Player *p, Deck *c, Player *dealer);

//Table Functions
void roundEnd(Player *p, Deck *c, Player *dealer);

//Deck Functions
void dealCard(Deck *deck, Player *p);

//	Player Functions
int getPlayerScore(Player *p);
int isPlayerBusted(Player *p);
void playerWin(Player *p);
void playerLose(Player *p);
int playerDecreaseBet(Player *p, unsigned int bet);
int playerIncreaseBet(Player *p, unsigned int bet);
int playerInput();
void playerTurn(Player *p);

#endif	//blackjack.h