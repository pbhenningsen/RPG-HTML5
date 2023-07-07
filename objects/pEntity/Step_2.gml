/// @desc Entity Loop
if (!global.gamePaused)
{
	depth = -bbox_bottom;
	if (lifted) && (instance_exists(oPlayer))
	{
		if (oPlayer.sprite_index != sPlayerLift)
		{
			x = oPlayer.x;
			y = oPlayer.y;
			z = 13;
			depth = oPlayer.depth - 1;
			
		}
	}
	
	if (!lifted)
	{
		//Be thrown
		if (thrown)
		{
			throwDistanceTravelled = min(throwDistanceTravelled + 3,throwDistance);//gonna move 3 pixels towards our total throw distance every frame
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);//adds x compenent and y component that we need to get it moving
			if (tilemap_get_at_pixel(collisionMap, x, y) > 0)//
			{
				thrown = false;
				grav = 0.1;//gravity, something we'll set to make sure nothing stays floating.
			}
			throwPercent = throwStartPercent + lerp(0,1 - throwStartPercent, throwDistanceTravelled/throwDistance);//
			z = throwPeakHeight * sin(throwPercent * pi);
			if (throwDistance == throwDistanceTravelled)
			{
				thrown = false;
				if (entityThrowBreak) instance_destroy();
			}
			
		}
		
		else 
		{
			//Fall back to earth if above 0 z
			if (z > 0)
			{
				z = max(z-grav,0);
				grav += 0.1;
				if (z ==0) && (entityThrowBreak) instance_destroy();
			}
			else
			{
				grav = 0.1;//resetting it.
			}
		}
	}
	
}
flash = max(flash-0.04, 0);//it will reduce by 0.04 every frame until it hits 0

