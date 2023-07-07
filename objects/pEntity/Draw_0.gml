if (entityShadow) draw_sprite(sShadow,0,floor(x),floor(y));

if (flash != 0)//enables flash shader
{
	shader_set(flashShader);//this command is expensive and can slow your game down if you overuse it, that's why you're making sure it doesn't activate if flash = 0
	uFlash = shader_get_uniform(flashShader,"flash");
	shader_set_uniform_f(uFlash, flash);//this sets the value in the shader, the flash value, to be what we need it to be
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


);

if (shader_current() != -1) shader_reset();






