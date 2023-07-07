function NewTextBox(){
/// @arg textmessage
/// @arg background
/// @arg [Responses]
var _obj;
if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
with (instance_create_layer(0,0,"Instances", _obj))
{
		textmessage = argument[0]
		if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
		if (argument_count > 2)
		{
			//trim markers from responses
			_responses = argument[2];
			responses = array_create(array_length(_responses),"");
			_arrayIndex = 0;
			while(_arrayIndex < array_length(_responses))
			{
				responses[_arrayIndex] = string_copy(_responses[_arrayIndex], 1, string_length(_responses[_arrayIndex]));
				 _arrayIndex++;
			 }
			for (var i =0; i < array_length(responses); i++)
			{	
			var _markerposition = string_pos(":",responses[i]);
			responseScripts[i] = string_copy(responses[i],1,_markerposition-1);
			responseScripts[i] = real(responseScripts[i]);
			responses[i]= string_delete(responses[i],1,_markerposition);//and just like that, we've eliminated the colon and the number to the left of it from things we want to display
			//breakpoint = 10;	
		}
	}
		else 
		{
		responses = [-1];
		responseScripts = [-1];
		}

with(oPlayer)
{
	if(state != PlayerStateLocked)
	{
		lastState = state;
		state = PlayerStateLocked;
	}
	
	
}

}
}