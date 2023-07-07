/// @desc Progress transition

//Begin steps of all objects happen before any objects' step events happen. This section needs to happen before the player gets a chance to run a step event. 

with (oPlayer) 
{
	if (state != PlayerStateDead) state  = PlayerStateTransition;// every single frame, at the beginning of the frame, we're going to make sure the player is locked into this state. 
}

if (leading == OUT)
{
	percent = min(1,percent + TRANSITION_SPEED);// we're doing min here so that we don't overshoot 1
	if (percent >=1)//if screen is fully obscured
	{
		room_goto(target);
		leading = IN;
	}
}
else//leading == in
{
	percent = max (0, percent - TRANSITION_SPEED);
	if (percent <= 0)//if screen fully revealed
	{
		with (oPlayer) state = PlayerStateFree;
		instance_destroy();	
	}
	
}