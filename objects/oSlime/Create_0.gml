// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSlime;
sprAttack = sSlimeAttack;
sprDie = sSlimeDie;
sprHurt = sSlimeHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] =SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

entityDropList = choose//THIS IS A GREAT WAY TO RANDOMIZE THINGS FOR SMALLER GAMES, IF YOU WANT TO MAKE ONE POSSIBILITY MORE LIKELY, JUST INCLUDE A BUNCH OF COPIES OF IT IN THIS LIST
(
	[oCoin],
	[oCoin,oCoin],
	[oBombDrop],
	[oArrowDrop],
)


