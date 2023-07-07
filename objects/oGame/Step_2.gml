/// @desc Pause the game
if (keyboard_check_pressed(vk_escape)) && (!instance_exists(oTransition))
{
	global.gamePaused = !global.gamePaused;//this lets you toggle back and forth between them by pressing the same button. 
	
	if (global.gamePaused)//If the game has JUST become paused
	{
		with (all)
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	}
	else //if the game has JUST become unpaused
	{
		with (all)
		{
			image_speed = gamePausedImageSpeed;
			
		}
	}

}



