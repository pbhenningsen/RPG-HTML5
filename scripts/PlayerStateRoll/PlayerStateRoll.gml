function PlayerStateRoll(){//whatever direction we're already in when we enter this state is going to be the direction we're going to continue to roll, because we've already established the direction in the player's step event
hSpeed = lengthdir_x(speedRoll, direction);//we're telling it to roll in the direction of direction, the variable we've already established
vSpeed = lengthdir_y(speedRoll, direction);

moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);//max tells you to pick the biggest of those two values
var _collided = PlayerCollision(); //this calls the collision script again, _collided is going to contain whatever value PLayerCollision returns


//Update Sprite
sprite_index = spriteRoll; 
var _totalFrames = sprite_get_number(sprite_index)/4;
image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining/ distanceRoll)) * (_totalFrames)), _totalFrames - 1);//the min part was added to compensate for the fact that without it, the animation ended on the first frame of the next set

//Change States
if (moveDistanceRemaining <= 0)
{
	state = PlayerStateFree;
}

if (_collided)
{
	state = PlayerStateBonk;
	moveDistanceRemaining = distanceBonk; //how far we wanna go during the Bonk effect. 
	ScreenShake(4,30);
}
}