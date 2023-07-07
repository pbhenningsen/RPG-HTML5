function SlimeWander(){
	sprite_index = sprMove;
	
	//At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)//wherever we're meaning to go, we've arrived. The second part is in case we run into a wall or something, as a safecheck for collisions.
	{
		hSpeed = 0;
		vSpeed = 0;
		//End our move animation
		if (image_index < 1)//this stops our sprite from animating, but not right away. Even when it arrives, it still finishes and runs through the last frame of animation. 
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
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
		image_speed = 1.0;//
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

function SlimeChase(){
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
	//Check if close enought to launch an attack
	if(instance_exists(target)) && (point_distance(x,y,target.x,target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		//target 8 pixels past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
}

function SlimeAttack(){
	//How fast to move
	var _spd = enemySpeed;
	
	//Don't move while still getting ready to jump
	if (image_index < 2) _spd = 0;
	
	//Freeze animation while in mid-air and also after landing finishes
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;//floor makes 3.3 become 3 and so on, flooring removes the decimal and sends us down to whatever integer we're on
	
	//How far we have to jump
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	//Begin landing end of the animation once we're nearly done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	//Move
	if(_distanceToGo > _spd)
	{
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to move and stop moving if we hit a wall
		if (EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	}else
	{
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)//if we're on the last frame of animation
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}

function SlimeHurt()
{
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);//we have that destination from when we get sent to this state in the first place, we're going to work out how far it is from where we currently are
		if (_distanceToGo > enemySpeed)
		{
			image_speed = 1.0;
			dir = point_direction(x,y,xTo,yTo);
			hSpeed = lengthdir_x(enemySpeed,dir);
			vSpeed = lengthdir_y(enemySpeed,dir);
			if (hSpeed != 0) image_xscale = -sign(hSpeed);//make sure we face the correct way, we want to face the opposite direction that we're moving because it's being knocked around
			
			//Collide & move, if there's a collision, then stop knockback
			if (EnemyTileCollision())
			{
				xTo = x;//if we collide with anything, our new goal is to get to where we currently are (in other words, to not move)
				yTo = y;
			}
		}
		else 
		{
			x = xTo;//we just go straight to our goal, since to move by our speed would mean that we would overshoot it
			y = yTo;
			if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;// we don't want to go immediately back into the attack state, it would be weird to go to that without first going back into the chase state
		}
}

function SlimeDie()
{
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x,y,xTo,yTo);//this makes it so that even when we're playing the death animation we move backwards with the knockback
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemySpeed,dir);
		vSpeed = lengthdir_y(enemySpeed,dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//Collide and move
		EnemyTileCollision();//makes sure we don't go past any walls. 
		
	}
	else 
	{
		x = xTo;
		y= yTo;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)//the (sprite_get_speed(sprite_index) is equal to 15 because that's the number of fps the animation is moving, the game_get_speed(gamespeed_fps) is 60
	{
		instance_destroy();
	}
}