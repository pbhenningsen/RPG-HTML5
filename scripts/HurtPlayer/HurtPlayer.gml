function HurtPlayer(_direction,_force,_damage)
{
	if (oPlayer.invulnerable <= 0)//figures out whether or not the player is invulnerable at this given moment by looking inside oPlayer and finding the current value of the invulnerable variable
	{
		global.playerHealth = max(0,global.playerHealth-_damage);//the max part of this prevents the player's health from ever dropping below 0
		
		if (global.playerHealth > 0)
		{
			with(oPlayer)//with is a loop statement that allows you to run some code in the context of another object
			{
				state = PlayerStateBonk;
				direction = _direction-180;
				moveDistanceRemaining = _force;
				ScreenShake(2,10);
				flash = 0.7;
				invulnerable = 60;//can't be hit again for the next 60 frames
				flashShader = shRedFlash;
			}
		}
		else
		{
			//kill the player
			with (oPlayer) state = PlayerStateDead;
		}
	}



}