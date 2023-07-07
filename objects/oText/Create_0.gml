/// @desc 

//Establish coordinates of Textbox (where it starts off)
x1 = RESOLUTION_W/2;//puts it in the middle of the screen
y1 = RESOLUTION_H-70;
x2 = RESOLUTION_W/2;//puts it in the middle of the screen
y2 = RESOLUTION_H;

//Increase width of box over time (since we're animating it)
x1Target = 0;//where it will wind up
x2Target = RESOLUTION_W;//where it will wind up

lerpProgress = 0;//linear interpolation progress is a number between 0 and 1 that tells us how far along our animation is. At the beginning it's set to 0.
textProgress = 0;//this is how we're going to create the letter by letter type effect. TRUST ME, YOU'LL WANT TO USE THIS AGAIN. 

responseSelected = 0;





