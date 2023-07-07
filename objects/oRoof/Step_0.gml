//This code makes it transperant when we're walking around underneath the roof (I think)

if (position_meeting(oPlayer.x,oPlayer.y,id))//we're checking if the player is actually touching its object (any of its colliison mask), we're going to make our image_alpha whichever is biggest out of the two values in the argument, it will slowly apprach 0.25 by 0.04 by every frame
{
	image_alpha = max(image_alpha - 0.04, 0.25);
}
else
{
	image_alpha = min(image_alpha + 0.04, 1.00);
}