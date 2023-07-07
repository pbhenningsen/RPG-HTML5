//Attack just started
function AttackSlash(){
	if (sprite_index != sPlayerAttackSlash) //check to see if we just started attack
	{	//Set up correct animation
		sprite_index = sPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
		
		//Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create(); //if there's no list (this is the first attack), we need to make one. 
		ds_list_clear(hitByAttack);//if the list does exist, we empty it. 
	}
	
CalcAttack(sPlayerAttackSlashHB);

//Update Sprite
PlayerAnimateSprite();

if(animationEnd)
{
	state = PlayerStateFree;
	animationEnd = false;//makes sure this variable is ready for the next time we need it. 
}
}


function AttackSpin(){

}

function CalcAttack(){
	mask_index = argument0;//that hitbox we just passed across in the Attack slash script becomes our new collision mask
	var hitByAttackNow = ds_list_create();//this will contain a list of all the entities hit by attack this frame, so we can compare that to things that have already been hit by the attack
	var hits = instance_place_list(x,y,pEntity,hitByAttackNow,false);//tells us the number of entities hit
	if (hits > 0) {//if hits > 0, we want to do a full loop and go through each one of them
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1){//ds_list_find_index is going to go through the DS list we just provided it(hitByAttack) and try to find this value (hitID), if it can find it, it will return the index of it, and if it can't find it, it will return -1, which means that this instance is not in our hitByAttack list, meaning we haven't yet hit it with this attack. 
				ds_list_add(hitByAttack,hitID);//that will take that instance ID, and stick it in that DS list. That way, in the future, if we were to hit it again and were to run through all this again, we would find that instance, run this, and it would not return -1 because it would be in the list, so it stops us from hitting it again. 
				with (hitID){//we're applying code to whichever instnace we've found in our collision detection for the attack
					//in here is where we do whatever we want to do to the instance that we've hit with the attack.
					if (object_is_ancestor(object_index, pEnemy))//this command will check an object to see if it is a child of a particular parent object. We're checking to see if the hitId's object index has pEnemy in its parents. 
					{
						HurtEnemy(id, 5, other.id, 10);
					}
					else if (entityHitScript != -1) script_execute(entityHitScript);
				}
		}
	}
	}
	ds_list_destroy(hitByAttackNow);//destroy the extra DS list we've made on this frame, we'll create it again on the next time we run through this
	mask_index = sPlayer;//setting our mask index back to sPlayer again at the end of the script. 
}

function HurtEnemy(_enemy,_damage,_source,_knockback)
{
	with (_enemy)
	{
		if (state!= ENEMYSTATE.DIE)
		{
			enemyHP -= _damage;//take whatever's in this value (in this case 5) and reduce enemy HP by that much
			flash = 1;//Enemies are children of pEntity, and pEntity has the ability to flash
			
			//Hurt or dead?
			if (enemyHP <= 0)
			{
				state = ENEMYSTATE.DIE;
			}
			else
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;//we load statePrevious with our current state before we go into our hurt state so that when we finish the hurt state, it just goes back to whatever state it was currently in. 
				state = ENEMYSTATE.HURT
			}
			
			image_index = 0;
			if (_knockback != 0)
			{
				var _knockDirection = point_direction(x,y,(_source).x,(_source).y);//gets the direction between wherever our enemy is and wherever the damage came from
				xTo = x - lengthdir_x(_knockback, _knockDirection);//by subtracting that, we end up going away from the source of the damage
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
	
		}
	}
}