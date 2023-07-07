// This is an example of a "Tile-Based" collision model
function PlayerCollision(){
var _collision = false;
var _entityList = ds_list_create();//when we walk into a space, we check that space for entities, and then we put those entities into a list called ds_list_create

//Horizontal Tiles...this is everything we need in order to horizontally collide with tiles. 
if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))//x+hspeed represents the tile we're ABOUT to move to. Y is just Y. 
{
	x -= x mod TILE_SIZE;// mod returns the remainder of an attempted division in total numbers. 
	if (sign(hSpeed) == 1) x += TILE_SIZE - 1;//I'm not entirely sure what this one does, but it somehow helps guaratee that we'll be on the very border of the tile. 
	hSpeed = 0;
	_collision = true;
}


// Horizontal Entities
var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);//we're doing this list thing because if we just did instance_position, we might run into a scenario where maybe two differnt instances occupy the same tile but one has a colliison mask and the other doesn't, we might run into an issue there where the game only registers the one without a collision mask and lets us step on this spot regardless, so that's why we're using the list function
var _snapX;//this stores the position we want to snap to, if there's a collision we want to move as close as possible to the boundary of whatever we collide with
while (_entityCount > 0)//if entity count is not 0, we know that there is an entity in the space that we are trying to move into. We're going to remove a lower entity count as we process each one, when it hits 0 we know we've processed everything we might collide with.
{
	var _entityCheck = _entityList[| 0];//so we're going to get the first entry in that ds_list
	if (_entityCheck.entityCollision == true)//all instances of pEntity have the variable entityCollision, that's why we can check for it
	{
		//Move as close as we can
		if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right + 1;///this just tells us if we're moving left or right, negative we're moving left, positive we're moving right, in this case we're moving left, so we're going to get the right-hand side of the bounding box of whatever entity it is, and add 1 to it, which will give us one pixel to the right of the entity. 
		else _snapX = _entityCheck.bbox_left -1;//in this case we're moving to the right 
		x = _snapX;//we work out where that out to be, and then we just set x to equal it
		hSpeed = 0;
		_collision = true;
		_entityCount = 0;//if we find a collision we don't want to bother going through all the rest of them, because we know we've found one, we don't want to bother checking more entities on the spot, we're just going to skip over them, so we just set entitycount to 0 and that will get us out of this while loop. 
	}
	ds_list_delete(_entityList, 0);//otherwise, we want to keep looping through this,checking for colliisons. This removes the first entry, entry 0, from _entityList, which will reduce the size of entityList
	_entityCount --;//this lowers entity count by 1 to keep us moving through the list by brinign us closer to 0, checking one entity at a time until we're out of entities to check. 
}

//Horizontal Move Commit
x += hSpeed;//THIS IS THE COMMAND THAT ULTIMATELY MAKES THE PLAYER MOVE HORIZONTALLY ACCORDING TO THE VARIABLE HSPEED.

// Clear list between axis
ds_list_clear(_entityList);

//Vertical Tiles...this is everything we need in order to vertically collide with tiles. 
if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))//x+hspeed represents the tile we're ABOUT to move to. Y is just Y. 
{
	y -= y mod TILE_SIZE;// mod returns the remainder of an attempted division in total numbers. 
	if (sign(vSpeed) == 1) y += TILE_SIZE - 1;//I'm not entirely sure what this one does, but it somehow helps guaratee that we'll be on the very border of the tile. 
	vSpeed = 0;
	_collision = true;
}

// Vertical Entities
var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false);//we're doing this list thing because if we just did instance_position, we might run into a scenario where maybe two differnt instances occupy the same tile but one has a colliison mask and the other doesn't, we might run into an issue there where the game only registers the one without a collision mask and lets us step on this spot regardless, so that's why we're using the list function
var _snapY;//this stores the position we want to snap to, if there's a collision we want to move as close as possible to the boundary of whatever we collide with
while (_entityCount > 0)//if entity count is not 0, we know that there is an entity in the space that we are trying to move into. We're going to remove a lower entity count as we process each one, when it hits 0 we know we've processed everything we might collide with.
{
	var _entityCheck = _entityList[| 0];//so we're going to get the first entry in that ds_list
	if (_entityCheck.entityCollision == true)//all instances of pEntity have the variable entityCollision, that's why we can check for it
	{
		//Move as close as we can
		if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom + 1;///this just tells us if we're moving left or right, negative we're moving left, positive we're moving right, in this case we're moving left, so we're going to get the right-hand side of the bounding box of whatever entity it is, and add 1 to it, which will give us one pixel to the right of the entity. 
		else _snapY = _entityCheck.bbox_top -1;//in this case we're moving to the right 
		y = _snapY;//we work out where that out to be, and then we just set x to equal it
		vSpeed = 0;
		_collision = true;
		_entityCount = 0;//if we find a collision we don't want to bother going through all the rest of them, because we know we've found one, we don't want to bother checking more entities on the spot, we're just going to skip over them, so we just set entitycount to 0 and that will get us out of this while loop. 
	}
	ds_list_delete(_entityList, 0);//otherwise, we want to keep looping through this,checking for colliisons. This removes the first entry, entry 0, from _entityList, which will reduce the size of entityList
	_entityCount --;//this lowers entity count by 1 to keep us moving through the list by brinign us closer to 0, checking one entity at a time until we're out of entities to check. 
}

//Vertical Move Commit
y += vSpeed;// THIS IS THE COMMAND THAT ULTIMATELY MAKES THE PLAYER MOVER VERTICALLY ACCORDING TO VSPEED. 

ds_list_destroy(_entityList);//This list will remain a memory unless we explicitly destroy it

return _collision;
}