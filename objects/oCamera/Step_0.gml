/// @desc Update Camera

//Update destination
if (instance_exists(follow))
	{
		xTo = follow.x;
		yTo = follow.y;
	}

//Update Object Position
x += (xTo - x) / 15; //xTo - x represents the difference between where we're going and where we currently are, always going to move towards our destination by 15% every step
y += (yTo - y) / 15;


// Keep camera center inside room

x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);//clamp lets us put in a value between min and max and it will keep it between those values
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

//Screenshake
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);

shakeRemain = max(0,shakeRemain - ((1/shakeLength) * shakeMagnitude));//this is what brings the screenshake gradually towards 0, we're removing a percentage of shakeMagnitude from shakeRemain every frame

//Set camera wherever this instance happens to be
camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf); //camera_set_view_pos actually sets this up according to the top left, so we've got to do the rest of the calculations to center it.
