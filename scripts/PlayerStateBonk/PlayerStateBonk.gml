// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateBonk(){
hSpeed = lengthdir_x(speedBonk, direction-180);//the -180 part is to make sure you're moving in the opposite direction as you once were. 
vSpeed = lengthdir_y(speedBonk, direction-180);

moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);//max tells you to pick the biggest of those two values
var _collided = PlayerCollision(); //this calls the collision script again, _collided is going to contain whatever value PLayerCollision returns


//Update Sprite
sprite_index = sPlayerHurt;
image_index = CARDINAL_DIR+2;

//Change Height
z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;


//Change States
if (moveDistanceRemaining <= 0)
{
	state = PlayerStateFree;
}
}