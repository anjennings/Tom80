
#include "Disk.h"

SimpleDisk DriveA;
SimpleDisk DriveB;
SimpleDisk DriveC;
SimpleDisk DriveD;


/**
 *  Called after write init command recieved
 *  Transfer data from PIO into buffer and write buffer to file
 **/
/*void handleWrite(SimpleDisk * Drive) {
  for (int i = 0; i < Drive->SectorSize; i++) {
    Drive->Buffer[i] = readPIO(); 
  } 
  writeSector(Drive);
}*/

/**
 *  Called after read init command recieved
 *  Read data from file into buffer and transfer buffer to PIO
 **/
void handleRead(SimpleDisk * Drive) {
  for (int i = 0; i < Drive->SectorSize; i++) {
    readSectorByte(Drive);
  } 
}  

/**
 *  Write buffer back into file
 *  Does NOT recieve data to PIO
 **/
void writeTrack(SimpleDisk * Drive) {
  long int tOffset = Drive->CurrentTrack * Drive->Sectors * Drive->SectorSize;
  
  if (Drive->image == NULL) {
    return; 
  } 
  if(fseek(Drive->image, tOffset, SEEK_SET)){
    return;
  }       
  fwrite(Drive->Buffer, 1, Drive->Sectors * Drive->SectorSize, Drive->image);
  fflush(Drive->image);
}

/**
 *  Read track of file into buffer
 *  Does NOT send data to PIO
 **/
void readTrack(SimpleDisk * Drive) {
  long int tOffset = Drive->CurrentTrack * Drive->Sectors * Drive->SectorSize;
  
  fseek(Drive->image, tOffset, SEEK_SET);
  fread(Drive->Buffer, sizeof(uint8_t), Drive->SectorSize * Drive->Sectors, Drive->image);
  Drive->Index = 0;
  setSector(Drive, 0);
}  

/**
 *  Send byte at index to PIO
 *  Assumes that readSector has already been called once
 **/
void readSectorByte(SimpleDisk * Drive) {
  writePIO(Drive->Buffer[(Drive->Sectors * Drive->CurrentSector) + Drive->Index]);
  Drive->Index++;
  if (Drive->Index == 128) {
    Drive->Index = 0;
    setSector(Drive, Drive->CurrentSector+1);
  }
}  

/**
 *  Get byte from PIO, place into buffer
 *  Assumes that readSector has already been called once
 **/
void writeSectorByte(SimpleDisk * Drive, uint8_t data) {   
  Drive->Buffer[Drive->Index + (Drive->SectorSize * Drive->CurrentSector)] = data;
  Drive->Index++;
  if (Drive->Index == 128) {
    Drive->Index = 0;
    setSector(Drive, Drive->CurrentSector+1);
    writeTrack(Drive);
  }
}  

// Set current track on drive and load new one into buffer
int setTrack(SimpleDisk * Drive, uint8_t track) {
  if ((track < 0) || (track >= Drive->Tracks))
    return -1;
  Drive->CurrentTrack = track;  
  return 0;
  readTrack(currentDrive);
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
      
    default:
      return -1;
      break;
      
  }     
}  

// Close disk image and free buffer
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
  DriveA.Buffer = malloc(DriveA.SectorSize * DriveA.Sectors * sizeof(uint8_t));
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

int initDisk() {
  
  currentDrive = NULL;
  if(sd_mount(SDDO, SDCLK, SDDI, SDCS)) {
    return -1;
  }   
  initDriveA();
  currentDrive = &DriveA;
  return 0;
}  
