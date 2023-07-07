// Inherit the parent event
event_inherited();

if (global.questStatus[? "TheHatQuest"] == 2) instance_destroy();//if the hat quest has already been completed, this tells Gamemaker to get rid of the hat
