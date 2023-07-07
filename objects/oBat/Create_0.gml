// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sBat;
sprAttack = sBat;
sprDie = sBatDie;
sprHurt = sBatHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = BatWander;
enemyScript[ENEMYSTATE.CHASE] = BatChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;//we don't have an attack state for the bat, he just flies into us, setting it to -1 so we know there's nothing there
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;//leaving these as slime, bc they already do everything they need to, no point rewriting it
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

entityDropList = choose//THIS IS A GREAT WAY TO RANDOMIZE THINGS FOR SMALLER GAMES, IF YOU WANT TO MAKE ONE POSSIBILITY MORE LIKELY, JUST INCLUDE A BUNCH OF COPIES OF IT IN THIS LIST
(
	[oCoin],
	[oCoin,oCoin],
	[oBombDrop],
	[oArrowDrop],
)


