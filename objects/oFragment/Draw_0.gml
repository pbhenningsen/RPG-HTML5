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
