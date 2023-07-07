/// @desc Execute State Machine
if (!global.gamePaused)
{
	if(enemyScript[state] != -1) script_execute(enemyScript[state]);
	depth = -bbox_bottom;//making sure our objects further down the screen show up above objects higher up on the screen
}




