shader_type canvas_item;

// Where there is an element to map, you must put a black texture behind it, else the world would be of the background color !

// In RGB, 1 equal approx to 0.0004 (0.00039...) so we use 0.0003 to see if it's 0 or more
const float EDGE = 0.01;

// New color for black ( will look black but wont be considered as of 'color to discard'
// In the tile textures, we are going to ignore colors that are pure black (0,0,0)
const vec3 black_to_me = vec3(0.0, 0.0, 0.02);

void fragment() {
	vec3 f = texture( TEXTURE, UV ).rgb;

	// step(a, b)
	// return 1 when b > a
	// return 0 when b < a
	float is_black = step(f.r, EDGE) * step(f.g, EDGE) * step(f.b, EDGE);
	// is_black will be equal to 1 when the color is black, then we use this to only mix the black part to the new wanted color;

	// mix(a, b, coef)
	// smooth interpolate between a to b, depending on coef
	// coef = 0.0 : return a
	// coef = 0.5 : return midle between a and b
	// coef = 1.0 : return b
	vec3 remaped_tex = mix(f, black_to_me, is_black);
	COLOR.rgb = remaped_tex;
}

