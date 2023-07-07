/// @desc Essential Entity Setup
z = 0;
flash = 0;
thrown = false;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
lifted = 0;
entityDropList = -1;//this makes it so we can give any entity in our game a drop list, a list of items as an array that we drop when this instance gets destroyed
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
spd = 0;