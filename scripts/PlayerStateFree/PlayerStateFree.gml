
function PlayerStateFree(){//This stuff only happens when we're in the "free" state.

//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();//This line of code just tells the script called PlayerCollision to run. I think hypothetically it's the same as entering all that code into there, but it's just a lot neater to put all that stuff in a script and run it with a single line. 

//Attack key logic
if (keyAttack)
{
	state = PlayerStateAttack;
	stateAttack = AttackSlash;
}


//Update Sprite Index
var _oldSprite = sprite_index;
if (inputMagnitude != 0)//You could do this based on speed, he prefers inputMagnitude, that way you keep running even if you're up against a wall vs. not moving. 
{
	direction = inputDirection;//This is to prevent the player instantly turning around and facing the other direction once they're done running. 
	sprite_index = spriteRun;
	
} else sprite_index = spriteIdle;
if (_oldSprite != sprite_index) localFrame = 0;//what this means is that if _oldsprite no longer equals the sprite_index it did in the last frame, you now know that they're no longer pressing that control ubtton and have changed movement/animation states, and so the localframe of the animation will be set to 0 to make it easier to move to that animation state. This is a neat and easy way to cleanly reset this every time you change animation. 


//Updating Image Index
PlayerAnimateSprite();//This line of code just tells the script called PlayerAnimateSprite to run. 



//Activate Key Logic
if (keyActivate)//you already set key_activate as "space" in the Player's create event. 
{
	//1. Check for an entity to activate. 
	//2. If there is nothing, or there is something, but it has no script. 
		//2a. If we are carrying something, throw it.
		//2b. Otherwise, roll!
	//3. Otherwise, there is someting and it has a script. -> Activate!
	//4. If the thing we activate is an NPC, make it face towards us. 
	
	var _activateX = x + lengthdir_x(10, direction);//working out the amount we have to move along the X axis to move 10 pixels in whatever direction we're currently facing, you need the x to account for the player's position
	var _activateY = y + lengthdir_y(10, direction);//how far in the y axis we'd have to move to move 10 pixels in whatever direction we're facing
	var _activateSize = 4;// more like half width
	var _activateList  = ds_list_create();//this is gonna store the list of entity IDs that we find in this little square area
	activate = noone;
	var _entitiesFound = collision_rectangle_list(//entitiesFound deals with the NUMBER of entities we find in our collision field
		_activateX - _activateSize,// wherever we are on the X axis, minus 4. 
		_activateY - _activateSize,// wherever we are on the Y axis, minus 4. 
		_activateX + _activateSize,//
		_activateY + _activateSize,
		pEntity,
		false,//not a precise collision
		true,//notme
		_activateList,
		true//ordered, when we call this function and put those id's into this list, they will be in a particular order, order will be based on the distance of these from the center of the rectangle
	);
	
	//If the first instance we find either our lifted entity or it has no script, try the next one. 
	while (_entitiesFound > 0)//we're going to go through the list and reduce the number by one each time, that's how we're going to cycle through the list. 
	{
		var _check = _activateList[| -- _entitiesFound];//the bottom of the list is however many entities have been found - 1. We're going to do that every single loop, which will make us work our way down the list. 
		if (_check != global.iLifted) && (_check.entityActivateScript != -1)
		{
			activate = _check;
			break;//this is a quick way to end the while loop. 
		}
		
	}
	
	
	ds_list_destroy(_activateList);
	
	
	//Roll if nothing to activate
	if (activate == noone)//Gamemaker actually cuts out the second part if it knows it doesn't need to check for it, which is why we can write this without getting an error textmessage. 
	{
		//Throw something if held, otherwise roll
		if (global.iLifted != noone)
		{
			PlayerThrow();
			
		}
		else 
		{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;//this is #2, the one where there's nothing to activate so it sends the character into a roll state.
		}
		
	}
	else 
	{
	//Activate the entity
		ScriptExecuteArray (activate.entityActivateScript, activate.entityActivateArgs);
		
	//Make an npc face the player
		if (activate.entityNPC)
		{
			with (activate)
			{
				direction = point_direction(x,y,other.x,other.y);//other refers to the instance calling the with statement
				image_index = CARDINAL_DIR;
			}
		}
		
	}
	
}
//Use Items
if (keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE)
{
	switch (global.playerEquipped)
	{
		case ITEM.BOMB: UseItemBomb();break;
		case ITEM.BOW: UseItemBow();break;
		case ITEM.HOOK: UseItemHook();break;
		default: break;
		
	}
	}

//Cycle Items
if (global.playerHasAnyItems)
{
	var _cycleDirection = keyItemSelectUp - keyItemSelectDown;//these will always = 0 or 1, by taking the one we want to use positively and subtracting the one we want to use negatively that's going to give this a value between -1 and 1 depending on which combo of these we have pressed. 
	if (_cycleDirection != 0)
	{
		do//similar to a while statement, does everything in this block UNTIL something isn't true, the difference is that do until will do the thing in the block at least once, and THEN check the condition, and if that condition isn;t true it'll keep doing that thing in the block, whereas the while statement will check the condition right away before it has done anything
		{
			global.playerEquipped += _cycleDirection;
			if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT -1;//takes us to whatever the last type of item is
			if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
			
		}
		until (global.playerItemUnlocked[global.playerEquipped]);
		
		
	}
}

}