event_inherited();

flashShader = shRedFlash;
bombStage = 0;
bombTickRate = [60,60,60,30,30,30,30,10,10,10,10,10,10,-1];//this is an array, these are the distances between flashes, so it flashes red, waits 60 frames, flashes red, waits 60 frames, etc. When we get to -1 we explode. 
bombTick = bombTickRate[0];


