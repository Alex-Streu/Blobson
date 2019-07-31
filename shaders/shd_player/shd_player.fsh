varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float sample[40];
uniform float replace[40];

uniform float fade_value;
uniform float light_value;
uniform float alpha_value;

void main()
	{
	//Applies all of the effects to the player
	
	for(int i = 0; i < 40; i+=4)
		{
		if (vec4(sample[i], sample[i+1], sample[i+2], sample[i+3]) ==
			v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ))
			{
			gl_FragColor = vec4(replace[i], replace[i+1], replace[i+2], replace[i+3]);
			gl_FragColor.rgb += light_value;
			gl_FragColor.rgb *= fade_value;
			gl_FragColor.a	 *= alpha_value;
			return;
			}
		}
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.rgb += light_value;
	gl_FragColor.rgb *= fade_value;
	gl_FragColor.a	 *= alpha_value;
	}
