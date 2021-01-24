#include "blackjack.h"

void blackJack(){
	
	//just do things on the stack for now
	//idk if malloc even works yet
	
	Table mainTable;
	Deck cardDeck;
	Player dealer, p1;
	
	mainTable.deck = &cardDeck;
	mainTable.players[0] = &dealer;
	mainTable.players[1] = &p1;
	
	PRINTSTR("\r\nWELCOME TO BLACKJACK!\r\n");
	
	blackJackInit(&mainTable);
	
	playGame(&mainTable);
	
}

void blackJackInit(Table *t){
	
	const Card Ace = {"A", 1, 1, 0 };
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

	Card types[13];
	
	types[0] = Ace;
	types[1] = Two;
	types[2] = Three;
	types[3] = Four;
	types[4] =	Five;
	types[5] =	Six;
	types[6] =	Seven;
	types[7] =	Eight;
	types[8] =	Nine;
	types[9] =	Ten;
	types[10] =	Jack;
	types[11] =	Queen;
	types[12] =	King;

	for(int i = 0; i < 2; i++){
		
		t->players[i]->numCards = 0;
		t->players[i]->chips = 100;
		t->players[i]->currentBet = 0;
		t->players[i]->wins = 0;
		t->players[i]->losses = 0;
		t->players[i]->busted = 0;
		memcpy(&t->players[i]->cards[0], &Ace, sizeof(Card));

	}
	
	t->players[0]->isDealer = 1;
	
	for(int j = 0; j < 52; j++){
		memcpy(&t->deck->cards[j], &types[j%13], sizeof(Card));
	}
}

void playGame(Table *t){
	
	for(int i = 0; i < 52; i++){
		PRINTSTR(t->deck->cards[i].id);
		PRINTSTR(" ");
	}
	
	PRINTSTR("\r\n");
	
	while(1){
		
		roundStart(t);
		roundMiddle(t);
		roundEnd(t);
		
	}
	
}

void roundStart(Table *t){
	
	PRINTSTR("Round Start!\r\n");
	
	for(int i = 0; i < 52; i++){
		t->deck->cards[i].delt = 0;
	}
	
	for(int j = 0; j < 2; j++){
		
		t->players[j]->busted = 0;
		t->players[j]->numCards = 0;
		t->players[j]->standing = 0;
		
		dealCard(t->deck, t->players[j]);
		dealCard(t->deck, t->players[j]);
	}
}

void roundMiddle(Table *t){
	
	int roundEnded = 0;
	
	while(roundEnded == 0){
		
		printPlayerStats(t);
		
		//TODO: does the dealer play first?
		dealerTurn(t->players[0], t->deck);
		playerTurn(t->players[1], t->deck);
		
		roundEnded = (t->players[1]->busted | t->players[1]->standing);
		
	}
	
}

void roundEnd(Table *t){
	
	//TODO: Show player scores, see who won
	PRINTSTR("Round End!\r\n");
	printPlayerStats(t);
	
}

void dealCard(Deck *deck, Player *p){
	
	//*insert Death Grips joke*
	
	int random = rand() % 52;
	while(deck->cards[random].delt != 0){
		random = rand() % 52;
	}
	
	memcpy(&p->cards[p->numCards], &deck->cards[random], sizeof(Card));
	deck->cards[random].delt = 1;
	p->numCards++;
	
	if(isPlayerBusted(p) != 0){
		playerLose(p);
	}
}

void printPlayerStats(Table *t){
	
	PRINTSTR("Dealer has : \r\n");
	for(int i = 0; i < t->players[0]->numCards; i++){
		PRINTSTR(t->players[0]->cards[i].id);
		PRINTSTR(",");
	}
	PRINTSTR("\r\n");
	
	PRINTSTR("You have : \r\n");
	for(int j = 0; j < t->players[1]->numCards; j++){
		PRINTSTR(t->players[1]->cards[j].id);
		PRINTSTR(",");
	}
	PRINTSTR("\r\n");
}

void dealerTurn(Player *p, Deck *d){
	PRINTSTR("Dealer Logic goes here\r\n");
}

//This and playerInput can probably be one function
void playerTurn(Player *p, Deck *d){
		
	switch(playerInput()){
		
		case FOLD:
			playerLose(p);
			break;
			
		case BET:
			break;
			
		case HIT:
			dealCard(d, p);
			break;
			
		case STAY:
			playerStand(p);
			break;
			
		default:
			break;
			
	}
}

int playerInput(){
	
	PRINTSTR("(H)it, (S)tand, or (F)old?\r\n");
	
	while(1){
		
		switch(GETCH()){
			case 'F' :
			case 'f' :
				return FOLD;
				break;
				
			case 'S' : 
			case 's' :
				return STAY;
				break;
				
			case 'H' :
			case 'h' : 
				return HIT;
				break;
				
			case 'B' :
			case 'b' :
				return BET;
				break;
				
			default:
				PRINTSTR("INVALID\r\n");
				break;
		}
		
	}
}

int playerDecreaseBet(Player *p, unsigned int bet){
	
	if(p->currentBet <= bet){
		return -1;
	}else{
		p->currentBet -= bet;
	}
	return 0;
}

int playerIncreaseBet(Player *p, unsigned int bet){
	
	if(p->chips < (p->currentBet + bet)){
		return -1;
	}else{
		p->currentBet += bet;
	}
	return 0;
}

void playerWin(Player *p){
	p->wins++;
}

void playerLose(Player *p){
	p->busted = 1;
	p->losses++;
}

void playerStand(Player *p){
	
	p->standing = 1;
	
}

int isPlayerBusted(Player *p){
	
	int score = 0;
	
	for(int i = 0; i < p->numCards; i++){
		
		score += (p->cards[i]).value;

	}
	
	return (int)(score>21);
	
}

int getPlayerScore(Player *p){
	
	int score = 0;
	
	//this is going to need a lot more work
	
	for(int i = 0; i < p->numCards; i++){
		
		if((p->cards[i]).isAce != 0){
			score += 11;
		}else{
			score += (p->cards[i]).value;
		}
		
	}
	
	return score;
}
