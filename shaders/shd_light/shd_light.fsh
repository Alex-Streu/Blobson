//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float light_value;
uniform float alpha_value;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.r+=light_value;
	gl_FragColor.g+=light_value;
	gl_FragColor.b+=light_value;
	gl_FragColor.a*=alpha_value;
}
