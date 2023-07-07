function PlayerThrow(){
	with (global.iLifted)//we can assume when we're calling this that there will be a global.iLifted and that it will contain the instance ID of the object we're carrying
	{
		lifted = false;
		persistent = false;
		thrown = true;//when this is true, the entity object will end up performing a thing in its step event
		z = 13;
		throwPeakHeight = z + 10;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (13/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;//inherits the player's direction.
		xstart = x;
		ystart = y;
		
	}
PlayerActOutAnimation(sPlayerLift);//this looks like throwing AND lifting, so we're just gonna use it as the throw animation, too
global.iLifted = noone;
spriteIdle = sPlayer;
spriteRun = sPlayerRun;
}