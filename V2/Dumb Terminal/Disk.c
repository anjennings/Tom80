
#include "Disk.h"

SimpleDisk DriveA;
SimpleDisk DriveB;

void createDiskImage(SimpleDisk * Drive) {
  //Create a dummy sector filled with 0's
  char * dummySector;
  dummySector = (char *) calloc((Drive->SectorSize), sizeof(uint8_t));
    
  // Create new File  
  Drive->image = fopen("A.img", "wb");
    
  //Fill disk image with 0'ed out sectors
  for(int i = 0; i < diskSectors((*Drive)); i++){
    fwrite(dummySector, sizeof(uint8_t), Drive->SectorSize, Drive->image);
  }
  fclose(Drive->image); 
}  

void initDriveA() {
  DriveA.Sectors = 26;
  DriveA.Tracks = 77;
  DriveA.SectorSize = 128;
  DriveA.BlockSize = 1024;
  DriveA.DriveLetter = 'A';
  DriveA.CurrentSector = 0;
  DriveA.CurrentTrack = 0;
  DriveA.image = fopen("A.img", "rb+");
  
  //If no file exists, create a new one (might take a while based on how large the image should be)
  if(DriveA.image == NULL) {
    fclose(DriveA.image);
    createDiskImage(&DriveA);  
  }
  //Image should now exist, new or old
  
  
}  

// The largest potential disk CPM can support
// Not implemented in CPM yet so do not call
void initDriveB() {
  DriveA.Sectors = 255;
  DriveA.Tracks = 255;
  DriveA.SectorSize = 128;
  DriveA.BlockSize = 1024;
  DriveA.DriveLetter = 'B';
  DriveA.CurrentSector = 0;
  DriveA.CurrentTrack = 0;
}  

void initDisk() {
  
  printf("Init Disk!\n");
  if(sd_mount(SDDO, SDCLK, SDDI, SDCS)) {
    printf("SD Card Mount Failure!\n");
    return;
  }   
  initDriveA();
  
  // Do stuff
  
  printf("Closing Disk!\n");
  fclose(DriveA.image);
}  
