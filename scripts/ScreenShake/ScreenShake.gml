/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second)
function ScreenShake(){
	with(global.iCamera)
	{
	if (argument[0] > shakeRemain)//makes sure a bigger screenshake isn't overtaken by a smaller one
	{
		shakeMagnitude = argument[0];
		shakeRemain = shakeMagnitude;
		shakeLength = argument[1];
	}
	}
}