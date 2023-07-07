function ActivateLiftable(id){
	if (global.iLifted == noone)//if you're not already carrying something
	{
		PlayerActOutAnimation(sPlayerLift);
		
		spriteIdle = sPlayerCarrying;
		spriteRun = sPlayerRunCarrying;
		
		
		
		
		
		global.iLifted = id;
		with(global.iLifted)
		{
			lifted = true;
			persistent = true;
			
		}
	}
	
}