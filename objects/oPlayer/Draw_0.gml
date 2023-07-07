draw_sprite(sShadow,0,floor(x),floor(y));

//Hookshot before player
if (state == PlayerStateHook) && (image_index != 3) DrawHookChain();//for any direction but down

if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0)// mod returns the remainder of a division, this makes it so that it counts down from 8 to 0 every eight frames, the < 2 part means that for three frames out of every 8, this becomes true, ergo the flickering effect
{
	//skip draw
	
} else
{
	if (flash != 0)
	{
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash,flash);
	}



draw_sprite_ext(//you don't have to put everything on one line, even for simple () stuff, you can break it up over different lines with commas
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),//this is the only difference between this command and draw_self(), this is how the shadow is created. 
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (shader_current() != -1) shader_reset();

//Hookshot (after player)
if (state == PlayerStateHook) && (image_index == 3) DrawHookChain();//specifically if we're facing down

}//draw as usual

function DrawHookChain()//you can declare functions outside of scripts...but it makes it local to every instance of oPlayer, can't call it from anywhere else. 
{
	var _originX = floor(x);
	var _originY = floor(y)-7;
	
	var _chains = hook div hookSize;//this will give us the exact number of times the hook chain will fit into this distance, integers only no decimals
	var _hookDirX = sign(hookX);//combining these numbers together will give us a vector of what direction we're facing
	var _hookDirY = sign(hookY);
	for (var i = 0; i < _chains; i++)//we're going to loop over every chain we draw and just draw each segment of chain
	{
		draw_sprite
		(
			sHookChain,
			0,
			_originX+hookX-(i*hookSize*_hookDirX),//these lines of code are for the animation of brining the hook back (I think...)
			_originY+hookY-(i*hookSize*_hookDirY)
		)
	}
	draw_sprite(sHookBlade,image_index,_originX+hookX,_originY+hookY);
}


