function PlayerStateHook()
{
	hSpeed = 0;
	vSpeed = 0;//resetting our speed at the start
	
	//If just arriving in this state
	if (sprite_index != sPlayerHook)//this means we've just arrived in this state from one of the other states
	{
		hook = 0;//tells us how far along our hook is
		hookX = 0;//these are just relative coordinates, relative to our player that tell us the exact position we're looking, on a vector either the horizontal or vertical
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING;
		hookedEntity = noone;
		
		//Update Sprite
		sprite_index = sPlayerHook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
			//Extend/Retract Hook
			var _speedHookTemp = speedHook;//for the sake of this function, we're turning speedHook into a local variable because we're going to modify it based on whether we're extending or retracting
			if (hookStatus != HOOKSTATUS.EXTENDING) _speedHookTemp *= -1;//if we're in any status other than HookStatus extending, we're going to multiply our speed by -1
			hook += _speedHookTemp;//I think this is when the hook is extending? It's adding to it...I'm not sure though the tutorial didn't make this entirely clear
			switch (image_index)//image_index tells us which direction we're in, based on 0 to 3
			{
				case 0: hookX = hook; break;//if we're facing to the right, we take hookX and we make it equal to hook...our horizontal hook position just becomes whatever hook is
				case 1: hookY = -hook; break;//if we're facing up, we modify hookY instead, we make that the negative of our hook because when you move up in Y, that's reducing the Y value 
				case 2: hookX = -hook; break;//left is making hookX negative hook
				case 3: hookY = hook; break;//down is making hookY positive hook
			}
			
		//Hookshot state machine
		switch (hookStatus)
		{
			case HOOKSTATUS.EXTENDING:
			{
				//Finish extending
				if (hook >= distanceHook) hookStatus = HOOKSTATUS.MISSED;//if it goes past a certain point, it counts as missed, and we start retracting
			
				//Check for hit
				var _hookHit = collision_circle(x+hookX,y+hookY,4,pEntity,false,true);//x+hookX takes the player's position(x) and adds a relative coordinate on top (hookX) to give us an absolute room position where the hook currently is. We then check a 4 pixel radius circle around that point for any instance of pEntity, 
				if (_hookHit != noone) && (global.iLifted != _hookHit)//if hookHit doesn't hit nothing, and we're not already holding the thing that we've hooked, otherwise the hookshot might collide with the thing you're already carrying
				{
					//Act depending on what is hit
					switch (_hookHit.entityHookable)//we're acting depending on what's hit by doing a switch statement with the ID of the thing we've hit and the varible it contains that we defined earlier in pEntity that tells us whether it's hookable
					{
						default: //not hookable entity
						{
							//...else potentially harm enemy
							if (object_is_ancestor(_hookHit.object_index,pEnemy))
							{
								HurtEnemy(_hookHit,1,id,5);//in this case the variable _hookHit represents the enemy, because we've set it to equal whatever we find in that collision circle
								hookStatus = HOOKSTATUS.MISSED;//this starts the hook retracting
							}
							else
							{
								if (_hookHit.entityHitScript != -1)//even if it's not an enemy, still want to check to see if it has a hit script
								{
									with (_hookHit) script_execute(entityHitScript);
									hookStatus = HOOKSTATUS.MISSED;
								}
							}
						}break;
						case 1:
						{
							hookStatus = HOOKSTATUS.PULLTOPLAYER;
							hookedEntity = _hookHit;
						}break;
						case 2:
						{
							hookStatus = HOOKSTATUS.PULLTOENTITY;
							hookedEntity = _hookHit;
						}break;
						
					}
				}	
						
			}break;
			
			//Pull the entity towards the hooked player
			case HOOKSTATUS.PULLTOPLAYER:
			{
				with (hookedEntity)
				{
				x = other.x + other.hookX;
				y = other.y + other.hookY;
				}
			}break;
			
			//Pull the player towards the hooked entity
			case HOOKSTATUS.PULLTOENTITY:
			{
				switch (image_index)//image_index tells us our direction, so we're basing this on them
				{
					case 0: x += speedHook; break;
					case 1: y -= speedHook; break;
					case 2: x -= speedHook; break;
					case 3: y += speedHook; break;
				}
			}break;
		}
		
		//Finish retract and end state
		if (hook <= 0)
		{
			hookedEntity = noone;
			state = PlayerStateFree;
		}
	}