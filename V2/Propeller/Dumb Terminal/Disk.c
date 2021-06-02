
#include "Disk.h"

SimpleDisk DriveA;
SimpleDisk DriveB;


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
/*void handleRead(SimpleDisk * Drive) {
  readSector(Drive);
  for (int i = 0; i < Drive->SectorSize; i++) {
    writePIO(Drive->Buffer[i]);
  } 
} */ 

/**
 *  Write buffer back into file
 *  Does NOT recieve data to PIO
 **/
void writeSector(SimpleDisk * Drive) {
  long int tOffset = Drive->CurrentTrack * Drive->Sectors * Drive->SectorSize;
  long int sOffset = Drive->CurrentSector * Drive->SectorSize;
  long int offset = tOffset + sOffset;
  
  fseek(Drive->image, offset, SEEK_SET);
  fwrite(Drive->Buffer, sizeof(uint8_t), Drive->SectorSize, Drive->image);
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
  if (Drive->Index >= 128) {
    data = 0;
  } else {   
    data = Drive->Buffer[Drive->Index];
  }    
  
  writePIO(data);
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

// Create disk image of appropriate size if none exists for this drive
void createDiskImage(SimpleDisk * Drive) {
    
  // Create filename from Drive letter
  char src[16];
  char dst[] = ".IMG";
  src[0] = Drive->DriveLetter;
  src[1] = '\0';
  strcat(src, dst);
  
  // Create new File  
  Drive->image = fopen(src, "wb");
    
  //Fill disk image with unused sectors
  for(int i = 0; i < diskSectors((*Drive)); i++){
    fwrite(Drive->Buffer, sizeof(uint8_t), Drive->SectorSize, Drive->image);
  } 
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
       
    default:
      return -1;
      break;
      
  }     
}  

// Close disk image and 
int closeDrive(SimpleDisk * drive) {
  if (drive == NULL) {
    return -1; 
  }    
  
  free(drive->Buffer);
  fclose(drive->image);
  currentDrive = NULL;
  return 0;
}  

/**
 *  Initilize the drive for reading and writing to disk image
 **/
void initDriveA() {
  DriveA.Sectors = 26;
  DriveA.Tracks = 77;
  DriveA.SectorSize = 128;
  DriveA.BlockSize = 1024;
  DriveA.DriveLetter = 'A';
  DriveA.CurrentSector = 0;
  DriveA.CurrentTrack = 0;
  DriveA.Index = 0;
  DriveA.Buffer = calloc(DriveA.SectorSize, sizeof(uint8_t));
  DriveA.image = fopen("A.img", "rb+");   //Open simply to see if the file exists
  
  //If no file exists, create a new one (might take a minute or so based on how large the image should be)
  if(DriveA.image == NULL) {
    fclose(DriveA.image);
    createDiskImage(&DriveA);  
  }
  fclose(DriveA.image);
  // Now file should be present and initilized
  DriveA.image = fopen("A.img", "rb+");
  //Drive should now be ready to read or write to
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
  // TODO
}  

int initDisk() {
  
  printf("Init Disk!\n");
  currentDrive = NULL;
  printf("SD Mount Call\n");
  if(sd_mount(SDDO, SDCLK, SDDI, SDCS)) {
    printf("SD Card Mount Failure!\n");
    return -1;
  }   
  printf("SD Mount Return\n");
  initDriveA();
  currentDrive = &DriveA;
  printf("Init Disk Complete!\n");
  return 0;
}  
