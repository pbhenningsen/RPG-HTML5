function PlayerAnimateSprite(){//This whole section basically ensures that the player animation works the way it's supposed to and that we ensure our animation is always on the right frame.  
var _totalFrames = sprite_get_number(sprite_index) / 4;//I think the 4 is because there are 4 different directions
image_index = localFrame + (CARDINAL_DIR * _totalFrames);//this is the "magic line", the one that makes sure we get the animation that perfectly corresponds to our movement. 
localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;//this line is also here to help work out which exact frame we should be on. 

//If animation would loop on next game step
if (localFrame >= _totalFrames)
{
	animationEnd = true;
	localFrame -= _totalFrames;
} else animationEnd = false;
}

