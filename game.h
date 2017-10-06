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
	int shieldEnable; //cheat
	int kills;
} PLAYER;

typedef struct {
	int row;
	int col;
	int spriteRow;
	int spriteCol;
	int size;
	int active;
	int type; //0 for comet, 1 for wave, etc.
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
	int active; //(1 = active, 0 = inactive)
	int type;
} BULLET;

void updateBoat(PLAYER *p);
void updateObstacle(OBSTACLE *o, int frame);
void fireObstacle(OBSTACLE *o, PLAYER *p);
void playerObstacleCollision(PLAYER *p, OBSTACLE *o);
void updateBullet(BULLET *bullet);
void fireBullet(BULLET *bullet, PLAYER *p);
void obstacleBulletCollision(BULLET *b, OBSTACLE *o, PLAYER *p);