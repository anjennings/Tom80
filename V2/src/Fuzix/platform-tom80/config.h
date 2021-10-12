/* Enable to make ^A drop back into the monitor */
#define CONFIG_MONITOR

/* Multiple processes in memory at once */
#define CONFIG_MULTI

/* Fixed banking */
#define CONFIG_BANK_FIXED

/* 8 48K banks, 1 is kernel */
#define MAX_MAPS	7
#define MAP_SIZE	0xC000U

#define CONFIG_LARGE_IO_DIRECT(x)	((x) != 1)
/* Banks as reported to user space */
#define CONFIG_BANKS	1
#define MAXPAGES	8

#define TICKSPERSEC 100     /* Ticks per second */
#define PROGBASE    0x0000  /* also data base  was 0x0*/
#define PROGLOAD    0x0100  /* also data base */
#define PROGTOP     0xbc00  /* Top of program, base of U_DATA copy */
#define PROC_SIZE   48	    /* Memory needed per process */

#define BOOT_TTY (512 + 1)/* Set this to default device for stdio, stderr */
                          /* In this case, the default is the first TTY device */

#define CMDLINE	NULL	  /* Location of root dev name */

/* Device parameters */
#define NUM_DEV_TTY 1

#define TTYDEV   BOOT_TTY /* Device used by kernel for messages, panics */

/* We will size the buffer pool to fill the space */
#define CONFIG_DYNAMIC_BUFPOOL
#define NBUFS    5        /* Number of block buffers */
#define NMOUNTS	 1	  /* Number of mounts at a time */

#define MAX_BLKDEV	1

#define CONFIG_FLOPPY

// #define DEBUG
// #define DDEBUG			/* Debug for drivers */

#define BOOTDEVICENAMES ""
