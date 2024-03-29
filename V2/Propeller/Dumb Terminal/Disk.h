#ifndef DISK_H_
#define DISK_H_

#include "simpletools.h"
#include "propeller.h"
#include "PIO.h"

// GPIO Pins
#define SDCLK 27
#define SDDI  26
#define SDCS  25
#define SDDO  24

// Structs
typedef struct SimpleDisk {
  uint16_t   Sectors;
  uint16_t   Tracks;
  uint16_t  SectorSize;
  uint16_t  BlockSize;
  char      DriveLetter;
  uint8_t   CurrentSector;
  uint8_t   CurrentTrack;
  FILE*     image;
  uint8_t*  Buffer;
  uint16_t   Index;
}SimpleDisk;  

// Macros
#define diskSectors(D) (D.Sectors * D.Tracks)
#define diskCapacity(D) (diskSectors(D) * D.SectorSize)

// Global Vars
SimpleDisk * currentDrive;

// Functions
void initDriveA();
void initDriveB();
void initDriveC();
void initDriveD();
int initDisk();
void createDiskImage(SimpleDisk * Drive);
int setSector(SimpleDisk * Drive, uint8_t sector);
int setTrack(SimpleDisk * Drive, uint8_t track);
void readSector(SimpleDisk * Drive);
void readSectorByte(SimpleDisk * Drive);
void writeSector(SimpleDisk * Drive);
void writeSectorByte(SimpleDisk * Drive, uint8_t data);
void handleWrite(SimpleDisk * Drive);
void handleRead(SimpleDisk * Drive);
int selectDrive(uint8_t drive);
int closeDrive(SimpleDisk * drive);
void readTransfer(SimpleDisk * Drive);
void initFUZIXDrive();

#endif // DISK_H_
