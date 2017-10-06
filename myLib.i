# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 42 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;


void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, unsigned short color);
void waitForVBlank();
void fillScreen(unsigned short color);
void drawBackgroundImage3(const unsigned short*);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb);

int rand();
void srand();
# 78 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 88 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
    const volatile void *src;
    const volatile void *dst;
    unsigned int cnt;
} DMA_CONTROLLER;
# 219 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 277 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 2 "myLib.c" 2

unsigned short * videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = (1 << 31) | control;
}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
 volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
     DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}

void drawRectInBounds(int row, int col, int height, int width, unsigned short color)
{
 volatile unsigned short c = color;
 if(col < 0)
 {
  width += col;
  col = 0;
 }
 if(col+width > 240)
 {
  width -= ((col+width)-240);
  col = 240;
 }
    for(int r = 0; r < height; r++) {
     DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}

void drawBackgroundImage3(const unsigned short * image)
{
 DMANow(3, (unsigned short *) image, videoBuffer, (240*160));
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
 for (int r=0; r<height; r++) {
  DMANow(3, (unsigned short *) &image[((r)*(width)+(0))], &videoBuffer[((row+r)*(240)+(col))], width);
 }
}

void fillScreen(unsigned short color)
{
 volatile unsigned short c = color;
 DMANow(3, &c, videoBuffer, (2 << 23) | 240 * 160);
}

void waitForVBlank()
{
 while(*(volatile u16 *)0x4000006>160);
 while(*(volatile u16 *)0x4000006<160);
}

void loadPalette(const unsigned short* palette)
{
 DMANow(3, (unsigned short*)palette, ((u16 *)0x5000000), 256);
}


void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{

 unsigned short newMap[mapLen];


 for(int i = 0; i < mapLen; i++)
 {

  unsigned short mask = map[i] & ~(((0xF) << 12));
  newMap[i] = mask | ((palIndex) << 12);
 }

 DMANow(3, newMap, &((screenblock *)0x6000000)[sbb], mapLen);
}
