# 1 "OAM.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "OAM.c"
# 1 "OAM.h" 1
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
# 231 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 289 "myLib.h"
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
# 2 "OAM.h" 2
# 1 "game.h" 1
typedef struct {
 int row;
 int col;
 int spriteRow;
 int spriteCol;
 int size;
 int height;
 int width;
 int active;
 int lives;
 int rowDel;
 int rowAcc;
 int colAcc;
 int waterRow;
 int shieldEnable;
 int kills;
} PLAYER;

typedef struct {
 int row;
 int col;
 int spriteRow;
 int spriteCol;
 int size;
 int active;
 int type;
 int colAcc;
 int rowAcc;
 int hits;
} OBSTACLE;

typedef struct {
 int row;
 int col;
 int spriteRow;
 int spriteCol;
 int height;
 int width;
 int rdel;
 int cdel;
 int color;
 int active;
 int type;
} BULLET;

void updateBoat(PLAYER *p);
void updateObstacle(OBSTACLE *o, int frame);
void fireObstacle(OBSTACLE *o, PLAYER *p);
void playerObstacleCollision(PLAYER *p, OBSTACLE *o);
void updateBullet(BULLET *bullet);
void fireBullet(BULLET *bullet, PLAYER *p);
void obstacleBulletCollision(BULLET *b, OBSTACLE *o, PLAYER *p);
# 3 "OAM.h" 2

OBJ_ATTR shadowOAM[128];
void DMAShadowOAM();
void hideSprites();
void OAMBoat(PLAYER *p);
void OAMObstacle(OBSTACLE *o, int oamidx);
void OAMBullet(BULLET *b, int oamidx);
void OAMString(int row, int col, char *str, int oamidx);
void OAMScoreBug(int row, int col, int oamidx);
# 2 "OAM.c" 2


void DMAShadowOAM() {
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

void hideSprites() {
 for (int i=0; i < 128; i++) {
  shadowOAM[i].attr0 = (2 << 8);
 }
}

void OAMBoat(PLAYER *p) {
 if (p->active) {
  shadowOAM[0].attr0 = p->row | (0 << 13) | (1 << 14);
  shadowOAM[0].attr1 = ((p->col) >> 8) | (0 << 14);
  shadowOAM[0].attr2 = (p->spriteRow)*32+(p->spriteCol);
 } else {
  shadowOAM[0].attr0 = (2 << 8);
 }

}

void OAMObstacle(OBSTACLE *o, int oamidx) {
 if (o->active == 1) {
  shadowOAM[oamidx].attr0 = ((o->row) >> 8) | (0 << 13) | (0 << 14);
  shadowOAM[oamidx].attr1 = ((o->col) >> 8) | (0 << 14);
  shadowOAM[oamidx].attr2 = (o->spriteRow)*32+(o->spriteCol);
 } else {
  shadowOAM[oamidx].attr0 = (2 << 8);
 }

}

void OAMBullet(BULLET *b, int oamidx) {
 if (b->active == 1) {
  shadowOAM[oamidx].attr0 = b->row | (0 << 13) | (0 << 14);
  shadowOAM[oamidx].attr1 = b->col | (0 << 14);
  shadowOAM[oamidx].attr2 = (b->spriteRow)*32+(b->spriteCol);
 } else {
  shadowOAM[oamidx].attr0 = (2 << 8);
 }
}


void OAMString(int row, int col, char *str, int oamidx) {
 int i = 0;
 while (*str) {
  shadowOAM[oamidx + i].attr0 = row | (0 << 13) | (0 << 14);
  shadowOAM[oamidx + i].attr1 = col | (0 << 14);
  shadowOAM[oamidx + i].attr2 = (8)*32+(*str - 48);
  str++;
  col+=5;
  i++;
 }
}

void OAMScoreBug(int row, int col, int oamidx) {
 shadowOAM[oamidx].attr0 = row | (0 << 13) | (1 << 14);
 shadowOAM[oamidx].attr1 = col | (3 << 14);
 shadowOAM[oamidx].attr2 = (9)*32+(0);
}
