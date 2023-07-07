
function PlayerActOutAnimation(sprite,endScript = -1){
	state = PlayerStateAct;
	sprite_index  = sprite;
	animationEndScript = endScript;
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();//otherwise you might have a little flicker at the start where it faces to the right by default
}