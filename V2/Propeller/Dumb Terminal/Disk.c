
#include "Disk.h"

SimpleDisk DriveA;
SimpleDisk DriveB;
SimpleDisk DriveC;
SimpleDisk DriveD;
SimpleDisk FuzixFS;

/**
 *  Called after read init command recieved
 *  Read data from file into buffer and transfer buffer to PIO
 **/
void handleRead(SimpleDisk * Drive) {
  //print("start sector read\n");
  readSector(Drive);
  for (int i = 0; i < Drive->SectorSize; i++) {
    writePIO(Drive->Buffer[i]);
  } 
}  

/**
 *  Write buffer back into file
 *  Does NOT recieve data to PIO
 **/
void writeSector(SimpleDisk * Drive) {
  long int tOffset = Drive->CurrentTrack * Drive->Sectors * Drive->SectorSize;
  long int sOffset = Drive->CurrentSector * Drive->SectorSize;
  long int offset = tOffset + sOffset;
  
  if(fseek(Drive->image, offset, SEEK_SET)){
    return;
  }    
  if (Drive->image == NULL) {
    return; 
  }    
  fwrite(Drive->Buffer, 1, Drive->SectorSize, Drive->image);
  fflush(Drive->image);
}

/**
 *  Read sector of file into buffer
 *  Does NOT send data to PIO
 **/
void readSector(SimpleDisk * Drive) {
  long int tOffset = Drive->CurrentTrack * Drive->Sectors * Drive->SectorSize;
  long int sOffset = Drive->CurrentSector * Drive->SectorSize;
  long int offset = tOffset + sOffset;
  
  fseek(Drive->image, offset, SEEK_SET);
  fread(Drive->Buffer, sizeof(uint8_t), Drive->SectorSize, Drive->image);
  Drive->Index = 0;
}  

/**
 *  Send byte at index to PIO
 *  Assumes that readSector has already been called once
 **/
void readSectorByte(SimpleDisk * Drive) {
  
  uint8_t data;
  if (Drive->Index >= Drive->SectorSize) {
    data = 0;
  } else {   
    data = Drive->Buffer[Drive->Index];
  }    
  
  writePIO(data);
  Drive->Index++;
}  

/**
 *  Get byte from PIO, place into buffer
 *  Assumes that readSector has already been called once
 **/
void writeSectorByte(SimpleDisk * Drive, uint8_t data) {
  
  if (Drive->Index >= Drive->SectorSize) {
    return;  
  }    
  
  Drive->Buffer[Drive->Index] = data;
  Drive->Index++;
}  

// Set current track on drive
int setTrack(SimpleDisk * Drive, uint8_t track) {
  
  if ((track < 0) || (track >= Drive->Tracks))
    return -1;
  Drive->CurrentTrack = track;  
  return 0;
}  

// Set current sector on drive
int setSector(SimpleDisk * Drive, uint8_t sector) {
  
  if ((sector < 0) || (sector >= Drive->Sectors))
    return -1; 
  Drive->CurrentSector = sector;  
  return 0;
} 

// Set new drive to be the current drive
// integer offset corresponds to letter 0=A, 1=B, etc
int selectDrive(uint8_t drive) {
  //print("selectDrive\n");
  if (currentDrive != NULL) {
    closeDrive(currentDrive);
  }  
   
  switch (drive) {
    
    case 0 :
      initDriveA();
      currentDrive = &DriveA; 
      return 0;
      break;
      
    case 1 :
      initDriveB();
      currentDrive = &DriveB;
      return 0;
      break;
      
    case 2 :
      initDriveC();
      currentDrive = &DriveC;
      return 0;
      break;
      
    case 3 :
      initDriveD();
      currentDrive = &DriveD;
      return 0;
      break;
      
    case 0xF :
      initFUZIXDrive();
      currentDrive = &FuzixFS;
      //print("selected Fuzix\n");
      return 0;
      break;
      
    default:
      //print("bad Drive\n");
      return -1;
      break;
      
  }     
}  

// Close disk image and 
int closeDrive(SimpleDisk * Drive) {
  if (Drive == NULL) {
    return -1; 
  }    
  
  free(Drive->Buffer);
  fclose(Drive->image);
  return 0;
}  

/**
 *  Initilize the drive for reading and writing to disk image
 **/
void initDriveA() {
  DriveA.Sectors = 26;
  DriveA.Tracks = 255;
  DriveA.SectorSize = 128;
  DriveA.BlockSize = 1024;
  DriveA.DriveLetter = 'A';
  DriveA.CurrentSector = 0;
  DriveA.CurrentTrack = 0;
  DriveA.Index = 0;
  DriveA.Buffer = calloc(DriveA.SectorSize, sizeof(uint8_t));
  DriveA.image = fopen("A.img", "r+");
}  


void initDriveB() {
  DriveB.Sectors = 26;
  DriveB.Tracks = 255;
  DriveB.SectorSize = 128;
  DriveB.BlockSize = 1024;
  DriveB.DriveLetter = 'B';
  DriveB.CurrentSector = 0;
  DriveB.CurrentTrack = 0;
  DriveB.Index = 0;
  DriveB.Buffer = malloc(DriveB.SectorSize * sizeof(uint8_t));
  DriveB.image = fopen("B.IMG", "r+");
}  

void initDriveC() {
  DriveC.Sectors = 26;
  DriveC.Tracks = 255;
  DriveC.SectorSize = 128;
  DriveC.BlockSize = 1024;
  DriveC.DriveLetter = 'C';
  DriveC.CurrentSector = 0;
  DriveC.CurrentTrack = 0;
  DriveC.Index = 0;
  DriveC.Buffer = malloc(DriveC.SectorSize * sizeof(uint8_t));
  DriveC.image = fopen("C.IMG", "r+");
}  

void initDriveD() {
  DriveD.Sectors = 26;
  DriveD.Tracks = 255;
  DriveD.SectorSize = 128;
  DriveD.BlockSize = 1024;
  DriveD.DriveLetter = 'D';
  DriveD.CurrentSector = 0;
  DriveD.CurrentTrack = 0;
  DriveD.Index = 0;
  DriveD.Buffer = malloc(DriveD.SectorSize * sizeof(uint8_t));
  DriveD.image = fopen("D.IMG", "r+");
}  

void initFUZIXDrive() {
  FuzixFS.Sectors = 256;
  FuzixFS.Tracks = 256;
  FuzixFS.SectorSize = 512;
  FuzixFS.DriveLetter = 'F';
  FuzixFS.CurrentSector = 0;
  FuzixFS.CurrentTrack = 0;
  FuzixFS.Index = 0;
  FuzixFS.Buffer = malloc(FuzixFS.SectorSize * sizeof(uint8_t));
  FuzixFS.image = fopen("FUZIX.IMG", "r+");
}  

int initDisk() {
  
  currentDrive = NULL;
  if(sd_mount(SDDO, SDCLK, SDDI, SDCS)) {
    return -1;
  }   
  initDriveA();
  currentDrive = &DriveA;
  return 0;
}  
