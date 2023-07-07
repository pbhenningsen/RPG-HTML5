if (!global.gamePaused)
{
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
	
	//Deteriorate
	deteriorate ++;
	if (deteriorate > deteriorateAfter)
	{
		image_alpha -= 1/deteriorateTime;//image_alpha tells us how transperant it will end up drawing, we remove 1/180th from image_alpha from every single frame
		if (image_alpha <= 0) instance_destroy();//just get rid of that object
		
	}
	
	//Friction
	fric = 0.05;
	if (z ==0) fric = 0.10;//this just makes them slide to a halt faster when they are on the ground (when the height is 0), so that you don't get slidey fragments or ultrastationary

	//Move
	x += lengthdir_x(spd, direction);//these will allow this to move in whatever direction or speed we want just by supplying it with a direction and a speed
	y += lengthdir_y(spd, direction);
	if (tilemap_get_at_pixel(collisionMap, x, y) > 0) spd = 0;//if there is a collision at wherever we are, set the speed to be = 0. 
	spd = max(spd -fric,0);//that's going to make it so we actually apply that friction. 
}


