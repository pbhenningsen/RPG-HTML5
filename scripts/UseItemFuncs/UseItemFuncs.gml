function UseItemBomb()
{
	if (global.playerAmmo[ITEM.BOMB] > 0) && (global.iLifted == noone)
	{
		global.playerAmmo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x,y,"Instances",oBomb);
		ActivateLiftable(_bomb);
	}

}

function UseItemBow()
{
	if (global.playerAmmo[ITEM.BOW] > 0) && (global.iLifted == noone)
	{
		global.playerAmmo[ITEM.BOW]--;
		PlayerActOutAnimation(sPlayerBow,PlayerFireArrow);//PlayerFireArrow is what will happen when that animation finishes
	}
}

function PlayerFireArrow()
{
	with (instance_create_depth(floor(x),floor(y)-7,depth,oArrow))
	{
		direction = other.direction;//faces same direction as our player
		direction = CARDINAL_DIR * 90;//we don't want to be able to fire these diagonally
		image_speed = 0;//we don't need them to animate
		image_index = CARDINAL_DIR;//I don't understand this line of code...makes sure that it uses the image of the arrow that corresponds to the direction your character is facing
		speed = 6;
	}
}

function UseItemHook()
{
	state = PlayerStateHook;
	localFrame = 0;
	
}