#include "blackjack.h"

void blackJack(){
	
	//just do things on the stack for now
	//idk if malloc even works yet
	
	Table mainTable;
	Deck cardDeck;
	Player p1;
	Player dealer;
	
	mainTable.deck = &cardDeck;
	mainTable.players[0] = &dealer;
	mainTable.players[1] = &p1;
	
	blackJackInit(&p1, &cardDeck, &dealer);
	
	
}

void roundStart(Table *t){
	
	for(int i = 0; i < 52; i++){
		t->deck->cards[i].delt = 0;
	}
	
	for(int i = 0; i < 2; i++){
		
		t->players[i]->busted = 0;
		t->players[i]->numCards = 0;
		
		dealCard(t->deck, t->players[i]);
		dealCard(t->deck, t->players[i]);
	}
}

void roundEnd(Player *p, Deck *c, Player *dealer){
	
	//what do here?
	
}

void playerTurn(Player *p, Deck *d){
	
	if(p->busted == 0){
		
		switch(playerInput()){
			
			case FOLD:
				playerLose(p);
				break;
				
			case BET:
				//when can this be done
				break;
				
			case HIT:
				dealCard(d, p);
				break;
				
			case STAY:
				break;
				
			default:
				break;
				
		}
	}
}

int playerInput(){
	//TODO
}

void dealCard(Deck *deck, Player *p){
	
	//*insert Death Grips joke*
	
	int random = rand() % 52;
	while(deck->cards[random].delt != 0){
		random = rand() % 52;
	}
	
	memcpy(p->cards[p->numCards], deck->cards[random], sizeof(Card));
	deck->cards[random].delt = 1;
	p->numCards++;
	
	if(isPlayerBusted(p) != 0){
		playerLose(p);
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

void blackJackInit(Player *p, Deck *c, Player *dealer) {
	
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

	p->numCards = 0;
	p->chips = 100;
	p->currentBet = 0;
	p->wins = 0;
	p->losses = 0;
	p->isDealer = 0;
	p->busted = 0;
	
	dealer->numCards = 0;
	dealer->chips = 0;
	dealer->currentBet = 0;
	dealer->wins = 0;
	dealer->losses = 0;
	dealer->isDealer = 1;
	dealer->busted = 0;
	
	for(int i = 0; i < 52; i++){
		memcpy(c->cards[i], types[i%13], sizeof(Card));
	}
	
}

int isPlayerBusted(Player *p){
	
	int score = 0;
	
	for(int i = 0; i < p->numCards; i++){
		
		if((p->cards[i]).isAce != 0){
			score += (p->cards[i]).value;
		}
	}
	
	return (int)(score>21);
	
}

int getPlayerScore(Player *p){
	
	int score = 0;
	
	for(int i = 0; i < p->numCards; i++){
		
		if((p->cards[i]).isAce != 0){
			score += 11;
		}else{
			score += (p->cards[i]).value;
		}
		
	}
	
	return score;
}