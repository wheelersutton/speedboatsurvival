#include "myLib.h"

unsigned short * videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row,col,240)] = color;
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	DMA[channel].src = source; 
	DMA[channel].dst = destination; 
	DMA[channel].cnt = DMA_ON | control; 
}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
	volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
    	DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], DMA_SOURCE_FIXED | width); 
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
    	DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], DMA_SOURCE_FIXED | width); 
    }   
}

void drawBackgroundImage3(const unsigned short * image)
{
	DMANow(3, (unsigned short *) image, videoBuffer, (240*160));
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
	for (int r=0; r<height; r++) {
		DMANow(3, (unsigned short *) &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET(row+r, col, 240)], width); 
	}
}

void fillScreen(unsigned short color)
{
	volatile unsigned short c = color;
	DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | 240 * 160); 
}

void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}

void loadPalette(const unsigned short* palette)
{
	DMANow(3, (unsigned short*)palette, PALETTE, 256);
}

//This function is to be used ONLY IF we are setting up a map with a custom palette index
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{
	//We are editing the actual map data, so this array is what we are going to use to replace the existing oen
	unsigned short newMap[mapLen];

	//We are going to iterate through every entry in this new map, and edit the entry to use a custom palette
	for(int i = 0; i < mapLen; i++)
	{
		// Here we mask the value in the current spot so we don't lose information
		unsigned short mask = map[i] & ~(PALBANK(0xF));
		newMap[i] = mask | PALBANK(palIndex);
	}
	// Finally we DMA in the new map to the appropriate sbb
	DMANow(3, newMap, &SCREENBLOCKBASE[sbb], mapLen);
}