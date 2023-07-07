bounce = 0;
deteriorate = 0;
z = 0;//height
spd = 0;
fric = 0;//friction, this slows our speed down over time, so the fragments sort of explode to a point and slow to a halt, and that fric is what's going to slow us down
image_speed = 0;//we don't want them to anmiate
image_index = irandom(image_number -1);//this is what frame we're going to have, a frame between 0 and the number of frames -1. We'll get either 0,1,2 or 3 (because there are 4 frames)
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));//this makes the fragments collide with the collision grid (building walls, etc), this gets the id of that layer, and then that gets the id of the tilemap that is on that layer. 
image_xscale = choose(-1,1);

