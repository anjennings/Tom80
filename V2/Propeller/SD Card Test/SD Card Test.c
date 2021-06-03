/*
  SD Minimal.side

  Create test.txt, write characters in, read back out, display.
*/

#include "simpletools.h"                      // Include simpletools header    

int DO = 24, CLK = 27, DI = 26, CS = 25;      // SD card pins on Propeller BOE

int main(void)                                // main function
{
  printf("boot\n");
  if (sd_mount(DO, CLK, DI, CS)) {
    printf("SD Mount Failed!\n");   
  } else {                      // Mount SD card

    FILE* fp = fopen("test.txt", "w");          // Open a file for writing
    fwrite("Testing 123...\n", 1, 15, fp);      // Add contents to the file
    fclose(fp);                                 // Close the file
 
    char s[15];                                 // Buffer for characters
    fp = fopen("test.txt", "r");                // Reopen file for reading
    fread(s, 1, 15, fp);                        // Read 15 characters
    fclose(fp);                                 // Close the file
  
    printf("First 15 chars in test.txt:\n");     // Display heading
    printf("%s", s);                             // Display characters
    printf("\n");                                // With a newline at the end
  }
}      