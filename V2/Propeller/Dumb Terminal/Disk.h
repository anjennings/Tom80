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
  uint8_t   Sectors;
  uint8_t   Tracks;
  uint8_t   SectorSize;
  uint16_t  BlockSize;
  char      DriveLetter;
  uint8_t   CurrentSector;
  uint8_t   CurrentTrack;
  FILE*     image;
  uint8_t*  Buffer;
}SimpleDisk;  

// Macros
#define diskSectors(D) (D.Sectors * D.Tracks)
#define diskCapacity(D) (diskSectors(D) * D.SectorSize)

// Global Vars
SimpleDisk * currentDrive;

// Functions
void initDriveA();
void initDriveB();
int initDisk();
void createDiskImage(SimpleDisk * Drive);
int setSector(SimpleDisk * Drive, uint8_t sector);
int setTrack(SimpleDisk * Drive, uint8_t track);
void readSector(SimpleDisk * Drive);
void writeSector(SimpleDisk * Drive);
void handleWrite(SimpleDisk * Drive);
void handleRead(SimpleDisk * Drive);
int selectDrive(uint8_t drive);
int closeDrive(SimpleDisk * drive);

#endif // DISK_H_
