
//{{BLOCK(sky)

//======================================================================
//
//	sky, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 152 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 4864 + 4096 = 9472
//
//	Time-stamp: 2016-11-17, 14:14:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKY_H
#define GRIT_SKY_H

#define skyTilesLen 4864
extern const unsigned short skyTiles[2432];

#define skyMapLen 4096
extern const unsigned short skyMap[2048];

#define skyPalLen 512
extern const unsigned short skyPal[256];

#endif // GRIT_SKY_H

//}}BLOCK(sky)
