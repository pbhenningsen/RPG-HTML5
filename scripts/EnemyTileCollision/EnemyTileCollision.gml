function EnemyTileCollision(){
	var _collision = false;
	if (tilemap_get_at_pixel(collisionMap,x + hSpeed, y))//checking a pixel on the tile map to see if it's occupied, if it is we snap to that side of that tile based on the direction we're going
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}
	x += hSpeed;

	if (tilemap_get_at_pixel(collisionMap,x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	y += vSpeed;
	
	return _collision;
}