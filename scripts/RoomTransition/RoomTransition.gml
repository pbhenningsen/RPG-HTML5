/// @desc RoomTransition(type,targetroom)
/// @arg Type
/// @arg TargetRoom

function RoomTransition(){
	if (!instance_exists(oTransition))
	{
		with (instance_create_depth(0,0,-9999,oTransition))//this will return the specific instance ID of the oTranstiion object that we've just made, and will send that ID to this with statement 
		{
			type = argument[0];
			target = argument[1];
			
		}
		
	}else show_debug_message("Trying to transition while transtion while transition is happening.");
}