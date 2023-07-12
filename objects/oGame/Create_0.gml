/// @desc Initialize & Globals
//This is where everything that needs to be initialized at the start of the game + global variables will live. 
randomize();///This is a function that will change the random seed of the game. Need this if you have any element of RNG (random number generator) anywhere in the game. This randomizes the seed of RNG. 

global.gameSaveSlot = 0;


global.gamePaused = false;
global.textSpeed = .75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iLifted = noone;//carries entity of whatever we happen to be carrying
global.playerHealthMax = 3.0;
global.playerMoney = 1000;
global.playerHealth = global.playerHealthMax;//this means that the max is our default/what we start with. 

//Items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.BOMB;
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1);
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, false);
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW] = 0;



global.questStatus = ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;//creates new entry in our map data structure called "The Hat Quest"


//global.iCamera = instance_create_layer(0,0,layer,oCamera);//the 0,0 doesn't really matter we're just putting anything, "layer" just means whatever layer we're currently on. 
global.iUI = instance_create_layer(0,0,layer,oUI);//making the oUI object at the start of our game. 

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);//this fixes that issue where the text box is appearing at the top left of the screen, makes it appear where we want it, try getting rid of it if you want to see what I mean. 
//room_goto(ROOM_START);

 
 
///Scaling With Views For HTML5
//base_width = 640;
//base_height = 360;
//width = base_width;
//height = base_height;



