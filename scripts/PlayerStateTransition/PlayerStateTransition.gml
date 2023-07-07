function PlayerStateTransition(){
	//Movement
	PlayerCollision();//looks for a collision, and moves us at whatever our hspeed and vspeed are
	
	//Update Image Index
	PlayerAnimateSprite();//Animate appropriately
}