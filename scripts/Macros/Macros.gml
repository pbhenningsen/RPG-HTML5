
#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90)//takes our direction and rounds it out to one of the four directions so we're always facing one of those 4 ways
#macro ROOM_START rVillage
#macro RESOLUTION_W 900
#macro RESOLUTION_H 540
#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

enum ENEMYSTATE//the reason we do this for our enemy states but not our player states is that we're going to have more than one kind of enemy in the game, that way they can all use this state machine even if each have different scripts to run during different states
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

enum ITEM
{
	NONE,
	BOMB,
	BOW,
	HOOK,
	TYPE_COUNT//this returns the number of entries that exist in that enum
}

enum HOOKSTATUS
{
	EXTENDING,
	PULLTOPLAYER,
	PULLTOENTITY,
	MISSED
}

