
//{{BLOCK(cityscape)

//======================================================================
//
//	cityscape, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 51 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 1632 + 8192 = 10336
//
//	Time-stamp: 2016-11-17, 14:15:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CITYSCAPE_H
#define GRIT_CITYSCAPE_H

#define cityscapeTilesLen 1632
extern const unsigned short cityscapeTiles[816];

#define cityscapeMapLen 8192
extern const unsigned short cityscapeMap[4096];

#define cityscapePalLen 512
extern const unsigned short cityscapePal[256];

#endif // GRIT_CITYSCAPE_H

//}}BLOCK(cityscape)
