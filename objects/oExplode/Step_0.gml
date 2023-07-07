if (!global.gamePaused)
{
	
	image_speed = 1.0
	//Hit Things
	if (image_index < 4)//this makes it so that only those first few frames of the explosion have the potential to damage something
	{
		var _entityList = ds_list_create();
		var _entityCount = instance_place_list(x,y,pEntity,_entityList,false);
		var _entity = noone;
		while (_entityCount > 0)
		{
			_entity = _entityList[| 0];
			if (ds_list_find_index(collisionHistory, _entity) == -1)//checks to see if what we're hitting is already on the collisionHistory list, makes sure we don't hit it again
			{
				with (_entity)
				{
					if (object_is_ancestor(object_index,pEnemy))
					{
						HurtEnemy(id,25,other.id,20);
					}
					else
					{
						if (entityHitScript != -1) script_execute(entityHitScript);
					}
				}
				ds_list_add(collisionHistory,_entity);//every time we hit something, we add that something to the collisionHistory list, 
			}
			ds_list_delete(_entityList,0);
			_entityCount--;
		}
		ds_list_destroy(_entityList);
	}
}
else
{
	image_speed = 0.0;//makes sure it doesn't animate while the game is paused	
}
