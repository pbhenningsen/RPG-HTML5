/// @desc Draw Textbox
NineSlicedBoxStretch(sTextBoxBg,x1,y1,x2,y2,background);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _print = string_copy(textmessage, 1, textProgress);// This is how the textmessage builds up over time. Gets the textmessage that we want to display to the screen. This contains the final textmessage that we want to draw, this function takes a string that we give it (textmessage is our full textmessage, index is where we want to start copying from, textProgress contains the number of characters we want to copy). 

if (responses[0] != -1) && (textProgress >= string_length(textmessage)) //-1 represents the value where we haven't put any responses into the textbox. The second part is what verifies that the text has fully displayed/finished displaying, as it makes sure that the textprogress is greater than or equal to the value of the length of the string it jus printed
{
	for (var i = 0; i < array_length(responses); i++)//we're gonna increment through our responses array, this is what helps us go from one to the next. Look for a line like this in Oregon.  we'll go from zero to i = 1, and then when it gets to two we know that 
	{
		_print += "\n";// means linebreak
		if (i == responseSelected) _print += "> ";  //this highlights the response
		_print += responses[i]; 
		if (i == responseSelected) _print +="< ";
	}

}
	
draw_text((x1+x2) /2, y1 + 8, _print);
draw_set_color(c_white) //we're drawing the text again, but in white
draw_text((x1+x2) /2, y1 + 7, _print);
