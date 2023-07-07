flash = max(0, flash-0.05);//flash degrades over time
fric = 0.05
if (z == 0) fric = 0.10//friction reduces speed over time

//Magnetize
if (instance_exists(oPlayer))
{
	var _px = oPlayer.x;//finds where the player is (assuming they exist)
	var _py = oPlayer.y;
	var _dist = point_distance(x,y,_px,_py);//get the distance between this coin and where the player is
	if (_dist < 16) //Magnet radius
	{
		spd += 0.25;//steadily increase our speed
		direction = point_direction(x,y,_px,_py);//point ourselves toward the player
		spd = min(spd,3);//gives us a cap that means it will never move faster than 3 pixels toward the character
		fric = 0;
		if (_dist < 5)//collect radius
		{
			if (collectScriptArg != -1)
			{
				script_execute(collectScript, collectScriptArg);//collectScript will point at a specific script that will contain a single function that will define what should happen for each collectible when it is actually collected, 
			}
			else
			{
				if (collectScript != -1) script_execute(collectScript);//this is for when you've picked something up, but there's no argument...it doesn't do anything, just adds one more of it to your inventory
			}
			instance_destroy();//gets rid of it when we pick it up
		}
	}
}

//Bounce
	if (bounceCount != 0)
	{
		bounce += (pi * bounceSpeed);//using a sin wave to help us get that arc, slowly ascend to a peak, then slowly fall back down again, this tell us the percentage of pi we want to bounce per frame (I think, but that might be wrong)
		if (bounce > pi)
		{
			bounce -= pi;//this will take into account any overlap, get it close to 0
			bounceHeight *= 0.6;//this reduces our bounce height every bounce, each one is 60% of the last bounce
			bounceCount --;//it will keep looping through bounceCount until it stops
			
		}
		z = sin(bounce) * bounceHeight;
	}
	else z = 0;//either we do the above, or we just set z to 0, also remember that z is height

x += lengthdir_x(spd,direction);//moves the object in whatever direction and speed we happened to have set
y += lengthdir_y(spd,direction);
spd = max(spd-fric,0);
depth = -bbox_bottom;





