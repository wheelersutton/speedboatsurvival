
//{{BLOCK(numbers)

//======================================================================
//
//	numbers, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 352 + 2048 = 2912
//
//	Time-stamp: 2016-11-20, 13:15:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_NUMBERS_H
#define GRIT_NUMBERS_H

#define numbersTilesLen 352
extern const unsigned short numbersTiles[176];

#define numbersMapLen 2048
extern const unsigned short numbersMap[1024];

#define numbersPalLen 512
extern const unsigned short numbersPal[256];

#endif // GRIT_NUMBERS_H

//}}BLOCK(numbers)
