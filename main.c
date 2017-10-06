//GAME DESCRIPTION:
//My game is called Speed Boat Survival.  The main "gameplay" of my game is to move around in the water
//and shoot enemies as they appear.  Shooting enemies scores you points as well as increases the
//difficulty of the game.  If you get hit by an enemy or go off the screen (hit the left side), you die.
//There is no win state - the player should want to get the highest score they can.
//KNOWN BUGS:
//I'm not currently aware of any bugs.  I've had multiple people playtest my game and we haven't found
//anything wrong with it.
//EXTRA CREDIT:
//1) I implemented a score/high score feature where players can input their initials and a list of top
//scores updates automatically
//2) Everything in the game (sprites and backgrounds) was custom designed.  I did steal some of the 
//tiles from Spriters Resource, but built all the backgrounds myself.
//3) The game has sounds for when players do things like click buttons, put in their initials on the 
//lose screen, etc. - gives them feedback when they push a button so their action was recognized by
//the game

#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "spritesheet.h"
#include "OAM.h"
#include "cityscape.h"
#include "text.h"
#include "sky.h"
#include "instructionsScreen.h"
#include "instructionsScreen2.h"
#include "sound.h"
#include "bullet.h"
#include "bgMusic.h"
#include "startscreen.h"
#include "pausescreen.h"
#include "losescreen.h"
#include "maintheme.h"
#include "pausesound.h"
#include "menubutton.h"
#include "explosion.h"
#include "highscoresscreen.h"
#include "nameselectsound.h"

unsigned int buttons;
unsigned int oldButtons;

char buffer[100];

int BG0vOff;
int BG0hOff;

int BG1vOff;
int BG1hOff;

int frame;

int difficulty;
int difficultyReducer;
int prevBoatKills;

int currObstacle;

int highScores[5];
char* initials[5];
char finalInitials[3];
int myScore = -1;

int letters[3];
int lidx = 0; //letter index

#define NUMOBSTACLES 40
#define NUMBULLETS 20

//OAM indicies
enum { INDEX_BOAT, INDEX_OBSTACLE , INDEX_BULLET = NUMOBSTACLES + INDEX_OBSTACLE, INDEX_TEXT, INDEX_SCOREBUG = 100};


enum { START, INSTRUCTIONS, GAME, PAUSE, LOSE, SCORES };
int state;

PLAYER boat;
OBSTACLE obstacles[NUMOBSTACLES];
BULLET bullets[NUMBULLETS];

//used for firing bullets
int bulletCount;
int prevBullet;

//Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToLose();
void lose();
void draw();
void update();
void pause();
void goToPause();
void goToInstructions();
void instructions();
void initialize();
void OAMSprites();
void OAMScore();
void goToScores();
void scores();
void updateHighScores();

int main() {

	goToStart();

	highScores[0] = 31;
	highScores[1] = 28;
	highScores[2] = 16;
	highScores[3] = 5;
	highScores[4] = 1;

	initials[0] = "RON";
	initials[1] = "BOB";
	initials[2] = "COW";
	initials[3] = "DAB";
	initials[4] = "DWS";

	letters[0] = 65;
	letters[1] = 65;
	letters[2] = 65;


	setupInterrupts();
	setupSounds();

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state) {
			case START:
				start();
				break;
			case INSTRUCTIONS:
				instructions();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case LOSE:
				lose();
				break;
			case SCORES:
				scores();
				break;
		}

		REG_BG1VOFS = BG0vOff;
		REG_BG1HOFS = BG0hOff;

		REG_BG2VOFS = BG1vOff;
		REG_BG2HOFS = BG1hOff;


		frame++;

		DMAShadowOAM();
	}
}



void initializeGame() {
	REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
	REG_BG1CNT = CBB(0) | SBB(30) | BG_SIZE3;
	REG_BG2CNT = CBB(1) | SBB(28) | BG_SIZE3;

	REG_BG0VOFS = 31;

	//load palette and DMA in bg0
	loadPalette(cityscapePal);
	DMANow(3, cityscapeTiles, &CHARBLOCKBASE[0], cityscapeTilesLen/2);
	DMANow(3, cityscapeMap, &SCREENBLOCKBASE[30], cityscapeMapLen/2);

	//DMA in bg1
	DMANow(3, skyTiles, &CHARBLOCKBASE[1], skyTilesLen/2);
	DMANow(3, skyMap, &SCREENBLOCKBASE[28], skyMapLen/2);

	//DMA in sprites
	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, 256);
}

void goToStart() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	fillScreen(BLACK);
	drawBackgroundImage3(startscreenBitmap);
	playSoundA(maintheme, MAINTHEMELEN, MAINTHEMEFREQ, 1);
	state = START;
}

void start() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
		playSoundB(menubutton, MENUBUTTONLEN, MENUBUTTONFREQ, 0);
	}
	if (BUTTON_PRESSED(BUTTON_A)) {
		goToInstructions();
		playSoundB(menubutton, MENUBUTTONLEN, MENUBUTTONFREQ, 0);
	}
}

void goToInstructions() {
	state = INSTRUCTIONS;
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	drawBackgroundImage3(instructionsScreenBitmap);
}

void goToInstructions2() {
	drawBackgroundImage3(instructionsScreen2Bitmap);
}

void instructions() {
	if (BUTTON_PRESSED(BUTTON_A)) {
		goToInstructions2();
		playSoundB(menubutton, MENUBUTTONLEN, MENUBUTTONFREQ, 0);
	}
	if (BUTTON_PRESSED(BUTTON_B)) {
		goToInstructions();
	}
	if (BUTTON_PRESSED(BUTTON_START)) {
		playSoundB(menubutton, MENUBUTTONLEN, MENUBUTTONFREQ, 0);
		goToGame();
	}
}

void goToGame() {

	initializeGame();

	hideSprites();

	OAMScoreBug(0, 0, INDEX_SCOREBUG);

	state = GAME;

	boat.row = 120;
	boat.col = SHIFTUP(100);
	boat.spriteRow = 0;
	boat.spriteCol = 1;
	boat.size = 16;
	boat.height = 8;
	boat.width = 16;
	boat.active = 1;
	boat.lives = 1;
	boat.rowDel = 1;
	boat.rowAcc = 5;
	boat.colAcc = 100;
	boat.waterRow = boat.row;
	boat.shieldEnable = 0;
	boat.kills = 0;

	for (int i = 0; i < NUMOBSTACLES; i++) {
		int obsType = rand() % 3;
		obstacles[i].row = 0;
		obstacles[i].col = 0;
		obstacles[i].size = 8;
		obstacles[i].active = 0;
		obstacles[i].colAcc = 0;
		obstacles[i].hits = 0;

		if (obsType == 0) {
			obstacles[i].type = 0;
			obstacles[i].spriteRow = 1;
			obstacles[i].spriteCol = 3;
		} else if (obsType == 1) {
			obstacles[i].type = 1;
			obstacles[i].spriteRow = 1;
			obstacles[i].spriteCol = 5;
		} else if (obsType == 2) {
			obstacles[i].type = 2;
			obstacles[i].spriteRow = 1;
			obstacles[i].spriteCol = 6;
		}
	}

	for (int i = 0; i < NUMBULLETS; i++) {
		bullets[i].row = 0;
		bullets[i].col = 0;
		bullets[i].spriteRow = 0;
		bullets[i].spriteCol = 3;
		bullets[i].active = 0;
		bullets[i].height = 8;
		bullets[i].width = 8;
	}

	//sets up bullet counters so they work consistently
	bulletCount = 0;
	prevBullet = -1;
	difficulty = 500;
	prevBoatKills = 0;

	playSoundA(bgMusic, BGMUSICLEN, BGMUSICFREQ, 1);

}

void game() {
	
	OAMSprites();
	update();
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}

}

void goToPause() {
	state = PAUSE;
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	fillScreen(BLACK);
	drawBackgroundImage3(pausescreenBitmap);
	playSoundB(pausesound, PAUSESOUNDLEN, PAUSESOUNDFREQ, 0);
	pauseSoundA();
}
void pause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		state = GAME;
		initializeGame();
		unpauseSoundA();
	}
	if (BUTTON_PRESSED(BUTTON_B)) {
		state = START;
		goToStart();
	}
}

void goToLose() {
	stopSound();
	playSoundA(explosion, EXPLOSIONLEN, EXPLOSIONFREQ, 0);
	state = LOSE;
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	drawBackgroundImage3(losescreenBitmap);
	itoa(boat.kills, buffer, 10);
	drawString(80, 150, buffer, WHITE);

	//draw initials stuff
	lidx = 0;
	for (int i = 0; i < 3; i++) {
		letters[i] = 65;
		drawChar(80, 95 + i*12, letters[i], RED);
	}
	drawChar(84, 95, 95, RED);
}

void lose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToScores();
		playSoundB(menubutton, MENUBUTTONLEN, MENUBUTTONFREQ, 0);
	}
	if (BUTTON_PRESSED(BUTTON_RIGHT)) {
		drawChar(84, 95 + lidx*12, 95, GREEN);
		lidx++;
		if (lidx > 2) {
			lidx = 0;
		}
		drawChar(84, 95 + lidx*12, 95, RED);
	}
	if (BUTTON_PRESSED(BUTTON_LEFT)) {
		drawChar(84, 95 + lidx*12, 95, GREEN);
		lidx--;
		if (lidx < 0) {
			lidx = 2;
		}
		drawChar(84, 95 + lidx*12, 95, RED);
	}
	if (BUTTON_PRESSED(BUTTON_UP)) {
		playSoundB(nameselectsound, NAMESELECTSOUNDLEN, NAMESELECTSOUNDFREQ, 0);
		drawChar(80, 95 + lidx*12, letters[lidx], GREEN);
		letters[lidx]++;
		if (letters[lidx] > 90) {
			letters[lidx] = 65;
		}
		drawChar(80, 95 + lidx*12, letters[lidx], RED);
	}
	if (BUTTON_PRESSED(BUTTON_DOWN)) {
		playSoundB(nameselectsound, NAMESELECTSOUNDLEN, NAMESELECTSOUNDFREQ, 0);
		drawChar(80, 95 + lidx*12, letters[lidx], GREEN);
		letters[lidx]--;
		if (letters[lidx] < 65) {
			letters[lidx] = 90;
		}
		drawChar(80, 95 + lidx*12, letters[lidx], RED);
	}
}

void OAMSprites() {
	OAMBoat(&boat);
	for (int i = 0; i < NUMOBSTACLES; i++) {
		OAMObstacle(&obstacles[i], i + INDEX_OBSTACLE);	
	}
	for (int i = 0; i < NUMBULLETS; i++) {
		OAMBullet(&bullets[i], i + INDEX_BULLET);
	}
	OAMScore();
}

void OAMScore() {
	itoa(boat.kills, buffer, 10);
	OAMString(15, 4, buffer, INDEX_TEXT);
}

void goToScores() {
	drawBackgroundImage3(highscoresscreenBitmap);
	state = SCORES;
	myScore = -1;
	updateHighScores();
	sprintf(buffer, "1st");
	drawString(50, 70, buffer, WHITE);
	sprintf(buffer, "2nd");
	drawString(65, 70, buffer, WHITE);
	sprintf(buffer, "3rd");
	drawString(80, 70, buffer, WHITE);
	sprintf(buffer, "4th");
	drawString(95, 70, buffer, WHITE);
	sprintf(buffer, "5th");
	drawString(110, 70, buffer, WHITE);

	for (int i = 0; i < 5; i++) {
		itoa(highScores[i], buffer, 10);
		drawString(50 + i*15, 100, buffer, WHITE);
		sprintf(buffer, initials[i]);
		drawString(50 + i*15, 140, buffer, WHITE);
		if (i == myScore) {
			sprintf(buffer, "*");
			drawString(50 + i*15, 63, buffer, GREEN);
			drawString(50 + i*15, 160, buffer, GREEN);
		}
	}
}

void updateHighScores() {
	for (int i = 0; i < 5; i++) {
		if (highScores[i] < boat.kills) {
			for (int j = 4; j > i; j--) {
				highScores[j] = highScores[j-1];
				initials[j] = initials[j-1];
			}
			highScores[i] = boat.kills;
			
			//put chars from letters in char array
			finalInitials[0] = letters[0];
			finalInitials[1] = letters[1];
			finalInitials[2] = letters[2];
			//put char array in char* array
			initials[i] = finalInitials;
			myScore = i;
			break;
		}
	}
}

void scores() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		playSoundB(menubutton, MENUBUTTONLEN, MENUBUTTONFREQ, 0);
		goToStart();
	}
}

void update() {
	updateBoat(&boat);

	//increases difficulty (by reducting it) every 10 kills
	//kind of weird, but lower difficulty makes obstacles more frequent
	//difficulty reducer helps run a check to see if there have been 10 kills
	//the whole prevBoatKills thing makes sure difficulty doesn't reduce when
	//the boat has 10, 20, 30, etc. kills and hasn't made another kill (otherwise
	//the difficulty would just reduce to 50 when 10 is achieved)
	difficultyReducer = (boat.kills % 10);
	if (difficultyReducer == 0 && prevBoatKills != boat.kills) {
		difficulty -= 50;
		if (difficulty <= 50) {
			difficulty = 50;
		}
		prevBoatKills = boat.kills;
	}
	//fires the obstacles at random times
	int random = rand() % difficulty;
	if (frame % random == 0) {
		fireObstacle(&obstacles[rand()%(NUMOBSTACLES-1)], &boat);
	}

	for (int i = 0; i < NUMOBSTACLES; i++) {
		updateObstacle(&obstacles[i], frame);
		playerObstacleCollision(&boat, &obstacles[i]);
	}

	for (int i = 0; i < NUMBULLETS; i++) {
		updateBullet(&bullets[i]);
	}

	for (int i = 0; i < NUMBULLETS; i++) {
		for (int j = 0; j < NUMOBSTACLES; j++) {
			obstacleBulletCollision(&bullets[i], &obstacles[j], &boat);
		}
	}

	//go to lose state if something deactivates the boat
	if (boat.active == 0) {
		goToLose();
	}

	//scroll backgrounds
	if (frame % 2 == 0) {
		BG0hOff++;
	}
	if (frame % 4 == 0) {
		BG1hOff++;
	}

	//fire bullets when A is pressed
	if (BUTTON_PRESSED(BUTTON_A)) {
		int pCol = SHIFTDOWN(boat.col);
		//if this is the first bullet, the previous bullet is at least 50 pixels away from the boat, 
		//or the previous bullet went inactive then fire a new bullet, set the previous bullet to be the
		//just fired bullet, and increase the bullet counter
		if (prevBullet == -1 || pCol + 20 <= bullets[prevBullet].col || !bullets[prevBullet].active) {
			playSoundB(bullet, BULLETLEN, BULLETFREQ, 0);
			fireBullet(&bullets[bulletCount], &boat);
			prevBullet = bulletCount;
			bulletCount++;
			//if bullet count exceeds numbullets, reset it to 0
			if (bulletCount >= NUMBULLETS - 1) {
				bulletCount = 0;
			}
		}
	}

	//enable/disable cheat
	if (BUTTON_PRESSED(BUTTON_B) && !boat.shieldEnable) {
		boat.shieldEnable = 1;
		boat.spriteCol = 9;
	} else if (BUTTON_PRESSED(BUTTON_B) && boat.shieldEnable) {
		boat.shieldEnable = 0;
		boat.spriteCol = 1;
	}

	//animates the boat sprite
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		if (frame % 10 == 0) {
			boat.spriteRow++;
			if (boat.spriteRow == 7) {
				boat.spriteRow = 0;
			}
		}
	} else {
		boat.spriteRow = 0;
	}

}