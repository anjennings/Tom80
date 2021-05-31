
void main()
{
   __asm
   IN A, (4);
   XOR 0x4;
   OUT (4), A;
   HALT;
   __endasm
}