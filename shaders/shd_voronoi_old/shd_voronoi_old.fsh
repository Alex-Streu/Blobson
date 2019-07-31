varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float point_x[250];
uniform float point_y[250];
uniform float point_r[250];
uniform float point_g[250];
uniform float point_b[250];
uniform float time;

void main()
	{
	//Find the closest node
	int closest = 0;
	float least = 1000.;
	for(int i=0;i<250;i++)
		{
		float dist = distance(v_vPosition,vec2(point_x[i],point_y[i]));
		if (dist < least)
			{
			least = dist;
			closest = i;
			}
		}
	float alpha = clamp(sin((float(point_x[closest] + point_y[closest]) + time) / 200.),0.0,0.75);
	gl_FragColor = vec4(point_r[closest],point_g[closest],point_b[closest],alpha);
	}
