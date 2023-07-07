/// @desc Cause a room transition

if (instance_exists(oPlayer)) && (position_meeting(oPlayer.x,oPlayer.y,id))//if you write an if statement with two conditions in it with && connecting them, it cheks these conditions in order, it requires both conditions to be true, but if the first condition is false, it doesn't matter what the second condition is. 
{
	if (!instance_exists(oTransition)) && (oPlayer.state != PlayerStateDead)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = oPlayer.direction;
		with (oPlayer) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE,targetRoom);
		instance_destroy();//make sure this doesn't repeat ad nauseum
	}
	
}
