/// @desc DropItems(x, y, [items])
/// @arg x
/// @arg y
/// @arg [items] array of items to drop

function DropItems(){
	var _items = array_length(argument2); 
	
	if (_items > 1)//if there's more than one item we want to drop
	{
		var _anglePerItem = 360/_items; //however many items there are, this will determine the space between each item. 
		var _angle = random(360);
		for (var i = 0; i < _items; i++)
		{
			with (instance_create_layer(argument0,argument1, "Instances", argument2[i]))
			{
				direction = _angle;
				spd = 0.75 + (_items * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
	
	} else instance_create_layer(argument0,argument1,"Instances",argument2[0]);
}