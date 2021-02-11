varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float saturation;
uniform float contrast;

void main() {

	vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float value = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	vec3 out_col = mix(vec3(value), base_col.rgb, saturation);
	
	vec4 sat_col = v_vColour * vec4(out_col, base_col.a);
	sat_col.rgb = (sat_col.rgb - .5) * contrast + .5;
	
    gl_FragColor = sat_col;
}
