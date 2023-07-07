lerpProgress += (1 - lerpProgress) / 50;//we start off adding a 50 to lerp progress, and that figure gets smaller and smaller as we get closer to 1, when it gets to 1 it cancels itself out because 1-1 is 0, so it will never go over one
textProgress += global.textSpeed;//itself plus .75 ever single frame. 

x1 = lerp(x1,x1Target,lerpProgress);//lerp function takes 2 values and gives you back a value that is a certain percentage between them, so if lerpProgress is .5, it will give you a number that is 50% of the way between x1 and xTarget. 
x2 = lerp(x2,x2Target,lerpProgress);
 
//Cycle through responses
keyUp = keyboard_check_pressed(vk_up)|| keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
responseSelected += (keyDown - keyUp);//making sure these cancel each other out if you press them both at the same time. 

//Wrap text
var _max = array_length(responses) - 1;//that maximum equals however many entries there are in the array minus one. 
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;

if (oPlayer.keyActivate)
{
	var _textmessageLength = string_length(textmessage);//we want to at least make sure the textmessage is on the screen before we let the player use space bar to destroy it.
	if (textProgress >= _textmessageLength)
	{
	
		if (responses[0] != -1)// it would only = -1 if we hadn't defined any responses. 
		{
			with (originInstance) DialogueResponses(other.responseScripts[other.responseSelected]);
		}
		instance_destroy();
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket --;//we subtract one from the ticket, moving the of textboxes queue along
		}
		else
		{
			with (oPlayer) state = lastState;//we;re unpausing the player and going back into their prior state
		}
	}
	else 
	{
	if (textProgress > 2)//this is so that if the textmessage isn't fully displayed yet, but the person keeps pressing space and clearly wants to rush through it, the textmessage will just display instantly so as not to keep them impatient. The reason it's > 2 is so that they at least have to wait until 2...nothing happens before then
	{
		textProgress = _textmessageLength;
	}
	}
}


