#include "game.h"
#include "myLib.h"
#include <stdio.h>

//these are predefined rows for the boat, obstacles, and bullets to travel on
//that fit with the background
int boatRow1 = 104;
int boatRow2 = 120;
int boatRow3 = 136;
int boatRow4 = 152;


void updateBoat(PLAYER *p) {
	//move boat up a row
	if (BUTTON_PRESSED(BUTTON_UP)) {
		if (p->row > boatRow1) {
			p->row-=16;
		}
		
	}
	//move boat down a row
	if (BUTTON_PRESSED(BUTTON_DOWN)) {
		if (p->row < boatRow4) {
			p->row+=16;
		}
	}

	//move boat forward on the screen - max it can go is to pixel col 100
	//when forward button is not held, moves boat back
	//if the boat touches pixel col 0, the boat goes inactive
	int pCol = SHIFTDOWN(p->col);
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		p->col += p->colAcc;
		//p->col++;
		if (pCol >= 200) {
			p->col = SHIFTUP(200);
		}
	} else {
		p->col -= p->colAcc;
		//p->col--;
		if (pCol == 0) {
			p->active = 0;
		}
	}

}

void updateObstacle(OBSTACLE *o, int frame) {
	if (o->active) {
		if (o->type == 0) { //type 0 - shootable enemy
			o->col -= o->colAcc;
			if (o->hits > 0) {
				if (o->spriteCol == 4) {
					o->spriteCol = 3;
				} else {
					o->spriteCol = 4;
				}
			}
			if (frame % 10 == 0) {
				o->spriteRow++;
				if (o->spriteRow >= 5) {
					o->spriteRow = 1;
				}
			}	
			if (o->col <= 0) {
				o->active = 0;
			}
		} else if (o->type == 1) { //type 1 - shootable enemy
			o->col -= o->colAcc;
			if (frame % 10 == 0) {
				o->spriteRow++;
				if (o->spriteRow >= 3) {
					o->spriteRow = 1;
				}
			}
			if (o->col <= 0) {
				o->active = 0;
			}
		} else if (o->type == 2) { //type 2 - non-shootable flying obstacles
			o->col -= o->colAcc;
			o->row += o->rowAcc;
			if (frame % 10 == 0) {
				o->spriteRow++;
				if (o->spriteRow >= 4) {
					o->spriteRow = 1;
				}
			}
			if (SHIFTDOWN(o->col) <= 0 || SHIFTDOWN(o->row) >= 160) {
				o->active = 0;
			}
		}
	}

}

//checks to make sure the obstacle we are firing is inactive
//assigns movement/acceleration based on what type of obstacle it is
//TYPE 1: shootable obstacle - moves horizontally @200 acceleration, starts at col 230
//TYPE 2: non-shootable obstacle - moves horizontally @150 acceleration, starts at col 230
//TYPE 3: non-shootable flying obstacle - moves diagonally @200 acceleration (starts at a random col)
void fireObstacle(OBSTACLE *o, PLAYER *p) {
	if (!o->active) {
		o->active = 1;
		if (o->type == 0) {
			o->col = SHIFTUP(240);
			o->colAcc = 200;
			o->hits = 0;
			o->spriteCol = 3;
		} else if (o->type == 1) {
			o->col = SHIFTUP(230);
			o->colAcc = 150;
			o->spriteCol = 5;
			o->hits = 0;
		} else if (o->type == 2) {
			int random = (rand() % 140) + 100; //fires at a random col between 160 and 200
			o->col = SHIFTUP(random);
			o->row = SHIFTUP(0);
			o->colAcc = 200;
			o->rowAcc = 200;
			o->spriteRow = 1;
			o->spriteCol = 6;
		}

		//semi-randomly assigns row to type 1 and 2 objects
		//sometimes it will assign the enemy row to the same row the player is on
		//other times it will assign it to a random row
		if (o->type == 0 || o->type == 1) {
			int random1 = rand() % 2;
			if (random1 == 0) {
				o->row = SHIFTUP(p->row);
			} else {
				int random2 = rand() % 4;
				switch(random2) {
					case 0:
						o->row = SHIFTUP(boatRow1);
						break;
					case 1:
						o->row = SHIFTUP(boatRow2);
						break;
					case 2:
						o->row = SHIFTUP(boatRow3);
						break;
					case 3:
						o->row = SHIFTUP(boatRow4);
						break;
				}
			}


		}

	}
}

//checks for collision between player and obstacle
//deactivates player occordingly
//if they're both active, check to see if player's left side col is hitting the obstacle's right side col
//if that is true, check if the player is hitting the obstacle in the correct row 
//(obstacle is not above or below, not touching)
//if it makes it thru the if block, then they must be touching and the player becomes inactive
void playerObstacleCollision(PLAYER *p, OBSTACLE *o) {
	int obsCol = SHIFTDOWN(o->col);
	int obsRow = SHIFTDOWN(o->row);
	int pCol = SHIFTDOWN(p->col);
	if (p->active == 1 && o->active == 1) {
		if (pCol + p->width >= obsCol && obsCol + o->size >= pCol) { //hits right side of boat
			if (obsRow + o->size >= p->row && obsRow <= p->row + p->height) {
				if (p->shieldEnable && o->type == 2) { //shield enabled, comet obstacle
					o->rowAcc = -200;
					o->spriteCol = 7;
				} else {
					p->active = 0;
				}
				
			}
		}
	}
}

//activates bullet and puts it adjacent to the boat
void fireBullet(BULLET *bullet, PLAYER *p) {
	bullet->active = 1;
	bullet->row = p->row + p->height/2 - 3;
	bullet->col = SHIFTDOWN(p->col) + p->width - 5;
	bullet->spriteCol = 4;
}

//increases bullet's col
//if the bullet goes off the screen, it becomes inactive and it
//is re-pooled (row and col are set back to 0)
void updateBullet(BULLET *bullet) {
	if (bullet->active == 1) {
		bullet->col+=3;
		if (bullet->col >= SCREENWIDTH) {
			bullet->active = 0;
			bullet->col = 0;
			bullet->row = 0;
		}		
	}
}

//checks to see if an obstacle collides with a bullet
//the only important collision here is between type 0 obstacles and bullets
//as type 1 and 2 obstacles can't be destroyed
//similar to playerObstacleCollision
//if the obstacle has not yet been hit, the it takes a hit, update which sprite
//image we are using, and deactivate the bullet
//if the obstacle has 1 hit, then both the obstacle and the bullet become inactive
void obstacleBulletCollision(BULLET *b, OBSTACLE *o, PLAYER *p) {
	int obsCol = SHIFTDOWN(o->col);
	int obsRow = SHIFTDOWN(o->row);
	if (o->active == 1 && b->active == 1) {
		if (b->col + b->width >= obsCol && b->col <= obsCol + o->size) {
			if (obsRow + o->size >= b->row && obsRow <= b->row + b->height) {
				if (o->type == 0) {
					if (o->hits == 2) {
						o->active = 0;
						b->active = 0;
						p->kills++;
					} else {
						o->hits++;
						o->spriteCol = 4;
						o->colAcc += 100;
						b->active = 0;
					}
				} else if (o->type == 1) {
					if (o->hits == 8) {
						o->active = 0;
						b->active = 0;
						p->kills++;
					} else {
						o->hits++;
						b->active = 0;
						o->spriteRow = 3;
					}
				}

			}
		}
	}
}