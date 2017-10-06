#include "myLib.h"
#include "game.h"

OBJ_ATTR shadowOAM[128];
void DMAShadowOAM();
void hideSprites();
void OAMBoat(PLAYER *p);
void OAMObstacle(OBSTACLE *o, int oamidx);
void OAMBullet(BULLET *b, int oamidx);
void OAMString(int row, int col, char *str, int oamidx);
void OAMScoreBug(int row, int col, int oamidx);