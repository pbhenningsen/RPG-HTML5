function SaveGame(){

	//Create save map
	var _map = ds_map_create();
	
	_map[? "room"] = room;//the word room will be used as the address of where we're storing the number of whatever room we're in
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "playerItemUnlocked"] = global.playerItemUnlocked;
	_map[? "playerAmmo"] = global.playerAmmo;
	_map[? "playerEquipped"] = global.playerEquipped;
	_map[? "playerHasAnyItems"] = global.playerHasAnyItems;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap,global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	//Save all of this to a string
	var _string = json_encode(_map);
	


}