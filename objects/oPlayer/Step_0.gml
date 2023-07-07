//Get Player Input
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));//this makes it so that both keys will work. If either one is true, the statement will return as true. 
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));//this is just a different way of writing an "or" satement. 
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);
keyItemSelectUp = keyboard_check_pressed(ord("E"));
keyItemSelectDown = keyboard_check_pressed(ord("Q"));

inputDirection = point_direction(0,0,keyRight-keyLeft, keyDown-keyUp);//This ensures that diagonal movements don't end up being faster. 
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);


if (!global.gamePaused) 
{
	script_execute(state);
	invulnerable = max(invulnerable-1,0);//decreasese invulnerable by 1 each frame, won't drop below 0
	flash = max(flash-0.05,0);//decreases flash by 0.5 each frame, won't drop below 0

}

depth = -bbox_bottom;

	