/// @desc Set up camera
cam = view_camera[0];//this sets it to the camera associated with Viewpoint 0
follow = oPlayer;
viewWidthHalf = camera_get_view_width(cam) * 0.5;//this is going to help the camera be cnetered on what with's following, always try to multiply because divisions take longer to do
viewHeightHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;//where we're heading towards
yTo = ystart;

shakeLength = 0;//how long the screenshake will last
shakeMagnitude = 0;//how strong the screenshake is
shakeRemain = 0;//how much of this particular screenshake is left to go
