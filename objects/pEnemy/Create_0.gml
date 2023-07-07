event_inherited();

//Intrinsic variables
state = ENEMYSTATE.IDLE;//based on whatever enum is in the state variable, gamemaker will choose that one and run the script
hSpeed = 0;
vSpeed = 0;
xTo = xstart;//these varibles will contain a destination we're heading to if we have one
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;//these variables will allow us to pass time waiting before it moves to a new spot
wait = 0;
aggroCheck = 0;
aggroCheckDuration = 5;//these two work together as a timer of sorts so that every 5 frames, we check to see if the player has gotten too close
stateTarget = state;
statePrevious = state;//
stateWait = 0;//How long we have waited for
stateWaitDuration = 0;//How long we are going to wait for


//Enemy Sprites
sprMove = sSlime;


//Enemy Scripts
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;










