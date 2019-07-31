//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float red;
uniform float blue;
uniform float green;
void main()
	{
    vec4 new_Color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	new_Color.b += blue;
	new_Color.g += green;
	new_Color.r += red;
	gl_FragColor = new_Color;
	}
