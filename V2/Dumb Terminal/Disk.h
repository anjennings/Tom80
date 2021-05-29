#ifndef DISK_H_
#define DISK_H_

#include "simpletools.h"
#include "propeller.h"

#define SDCLK 27
#define SDDI  26
#define SDCS  25
#define SDDO  24

typedef struct SimpleDisk {
  uint8_t   Sectors;
  uint8_t   Tracks;
  uint8_t   SectorSize;
  uint16_t  BlockSize;
  char      DriveLetter;
  uint8_t   CurrentSector;
  uint8_t   CurrentTrack;
  FILE*     image;
}SimpleDisk;  

#define diskSectors(D) (D.Sectors * D.Tracks)
#define diskCapacity(D) (diskSectors(D) * D.SectorSize)

void initDriveA();
void initDriveB();
void initDisk();

#endif // DISK_H_
