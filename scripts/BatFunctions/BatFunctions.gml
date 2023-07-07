function BatChase ()
{
	sprite_index = sprMove;
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed)//meaning that we've got more distance to go than the distance we'll move this step
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		} 
		else 
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		//Collide and Move
		EnemyTileCollision();
	}
}
function BatWander()
{
	sprite_index = sprMove;
	image_speed = 1.0;
	
	//At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)//wherever we're meaning to go, we've arrived. The second part is in case we run into a wall or something, as a safecheck for collisions.
	{
		hSpeed = 0;
		vSpeed = 0;
		//Set new target destination
		if (++wait >= waitDuration)//adds 1 to wait and THEN returns wait, unlike if you had put the ++ after wait, basically it means that once wait's value gets higher than a certain point, we'll pick a new destination
		{
			wait = 0;//resets it
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);//we point ourselves in the direction of our original position and then just sort of vary it by 45 degrees either way, so we're always sort of going back on ourselves in a little loop in a semi-random way. 
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
		
		
	}else //Move towards new destination
	{
		timePassed ++;//by adding one, eventually we'll reach the desination and give up
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if(_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;//if our current speed means we're going to overshoot our destination, we set our speed to be whatever the distance is to guarantee that we'll exactly arrive
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedThisFrame,dir);
		vSpeed = lengthdir_y(_speedThisFrame,dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);//this flips the sprite x direction based on whether we moved left or right
		
		//Collide & Move
		EnemyTileCollision();
		
	
	}
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oPlayer)) && (point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = oPlayer;//hypothetically you could make it chase something else by changing this target
		}
	}
	
}