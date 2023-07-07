state = PlayerStateFree;//you're not actually calling the script here, you're just referring to the script itself, you're saying that the state refers to this script
stateAttack = AttackSlash;
hitByAttack = -1;//we're going to store a list of everything we've hit in this variable so that we don't hit them again. 
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));//this line of code finds the collision map inside of the tile layer ("Col")


image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
speedBonk = 1.5;
speedHook = 3.0;

distanceRoll = 52;
distanceBonk = 40;
distanceBonkHeight = 12;
distanceHook = 88;




z = 0;
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;
animationEndScript = -1;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;//Setting these as variables allows us to change them later on in the game. 
spriteIdle = sPlayer;
localFrame = 0;//tells us which frame we're on RELATIVE to which directional animation it is (up, down, etc.)

hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(sHookChain);


if (global.targetX != -1)//if targetX is -1, we can assume targetY also is. DOES THIS CONTROL MOVEMENT?
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

if (global.iLifted != noone)
{
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerRunCarrying;
	sprite_index = spriteIdle;//this line of code has something to do with transition states, but I'm not sure what
}