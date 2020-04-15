#define A0 9
#define A1 8
#define A2 7
#define A3 6
#define A4 5
#define A5 4
#define A6 3
#define A7 2

#define O0 10
#define O1 11
#define O2 12
#define O3 19
#define O4 18
#define O5 17
#define O6 16
#define O7 15

#include <stdio.h>

bool d0;
bool d1;
bool d2;
bool d3;
bool d4;
bool d5;
bool d6;
bool d7;

char hex[4];
char adr[4];
uint8_t data;

void setup() {
  // put your setup code here, to run once:

  pinMode(A0, OUTPUT);
  pinMode(A1, OUTPUT);
  pinMode(A2, OUTPUT);
  pinMode(A3, OUTPUT);
  pinMode(A4, OUTPUT);
  pinMode(A5, OUTPUT);
  pinMode(A6, OUTPUT);
  pinMode(A7, OUTPUT);
  
  pinMode(O0, INPUT);
  pinMode(01, INPUT);
  pinMode(O2, INPUT);
  pinMode(03, INPUT);
  pinMode(O4, INPUT);
  pinMode(05, INPUT);
  pinMode(O6, INPUT);
  pinMode(07, INPUT);

  Serial.begin(9600);
  delay(1000);
}

void loop() {
  
  for(int i = 0; i <= 255; i++){
    digitalWrite(A0, (i&(1<<0))>>0);
    digitalWrite(A1, (i&(1<<1))>>1);
    digitalWrite(A2, (i&(1<<2))>>2);
    digitalWrite(A3, (i&(1<<3))>>3);
    digitalWrite(A4, (i&(1<<4))>>4);
    digitalWrite(A5, (i&(1<<5))>>5);
    digitalWrite(A6, (i&(1<<6))>>6);
    digitalWrite(A7, (i&(1<<7))>>7);

    delay(125);

    d0 = digitalRead(O0);
    d1 = digitalRead(O1);
    d2 = digitalRead(O2);
    d3 = digitalRead(O3);

    d4 = digitalRead(O4);
    d5 = digitalRead(O5);
    d6 = digitalRead(O6);
    d7 = digitalRead(O7);

    delay(125);

    data = (d0 | (d1<<1) | (d2<<2) | (d3<<3) | (d4<<4) | (d5<<5) | (d6<<6) | (d7<<7) | 0);
    
    sprintf(hex, "0x%d", data);

    sprintf(adr, "%i", i);

    Serial.write("Reading : ");
    Serial.write(adr);
    Serial.write(" : ");
    Serial.write(hex);
    Serial.write('\n');
    Serial.write('\r');
  }

}
