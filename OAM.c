#include "OAM.h"
#include "myLib.h"

void DMAShadowOAM() {
	DMANow(3, shadowOAM, OAM, 128*4);
}

void hideSprites() {
	for (int i=0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

void OAMBoat(PLAYER *p) {
	if (p->active) {
		shadowOAM[0].attr0 = p->row | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[0].attr1 = SHIFTDOWN(p->col) | ATTR1_SIZE8;
		shadowOAM[0].attr2 = SPRITEOFFSET16(p->spriteRow, p->spriteCol);
	} else {
		shadowOAM[0].attr0 = ATTR0_HIDE;
	}

}

void OAMObstacle(OBSTACLE *o, int oamidx) {
	if (o->active == 1) {
		shadowOAM[oamidx].attr0 = SHIFTDOWN(o->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[oamidx].attr1 = SHIFTDOWN(o->col) | ATTR1_SIZE8;
		shadowOAM[oamidx].attr2 = SPRITEOFFSET16(o->spriteRow, o->spriteCol);
	} else {
		shadowOAM[oamidx].attr0 = ATTR0_HIDE;
	}

}

void OAMBullet(BULLET *b, int oamidx) {
	if (b->active == 1) {
		shadowOAM[oamidx].attr0 = b->row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[oamidx].attr1 = b->col | ATTR1_SIZE8;
		shadowOAM[oamidx].attr2 = SPRITEOFFSET16(b->spriteRow, b->spriteCol);
	} else {
		shadowOAM[oamidx].attr0 = ATTR0_HIDE;
	}
}


void OAMString(int row, int col, char *str, int oamidx) {
	int i = 0;
	while (*str) {
		shadowOAM[oamidx + i].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[oamidx + i].attr1 = col | ATTR1_SIZE8;
		shadowOAM[oamidx + i].attr2 = SPRITEOFFSET16(8, *str - 48); //48 b/c 0 is 48 in decimal, 1 is 49, etc.
		str++;
		col+=5;
		i++;
	}
}

void OAMScoreBug(int row, int col, int oamidx) {
	shadowOAM[oamidx].attr0 = row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[oamidx].attr1 = col | ATTR1_SIZE64;
	shadowOAM[oamidx].attr2 = SPRITEOFFSET16(9, 0);
}
