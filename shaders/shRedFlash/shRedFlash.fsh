//
// Simple passthrough fragment shader (a shader is a mini program that runs on your graphics card, and therefore allows you to do cool stuff with the way you draw stuff, we're directly manipulating how we draw to a screen)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float flash;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//determines the final color of the pixel we are finally drawing, which it gets from the sprite that we've passed through to the graphics card to be drawn to the screen, it gets the appropriate colors from that, here we're going to tie fade's value to the red value the green value and the blue value, giving that variable the full spectrum
	gl_FragColor = vec4(
	gl_FragColor.r + flash,
	gl_FragColor.g - flash,
	gl_FragColor.b - flash,
	gl_FragColor.a);
	
}

