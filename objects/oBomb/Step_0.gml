event_inherited();

if (!global.gamePaused)
{
	bombTick--;
	if (bombTick == 0)
	{
		flash = 0.75;//this will work with our pEntity code to cause the flash to happen
		bombStage++;
		bombTick = bombTickRate[bombStage];//this makes it go to the next entry of the array
	}
	
	if (bombTick < 0)//only time this would ever happen is when we've gotten to the last entry of the array (-1_
	{
		y -= z; //forces bomb onto the floor in case its in mid-air when it goes off, this might feel weird
		if (lifted)
		{
			PlayerDropItem();
		}
		instance_destroy();
	}
	
}