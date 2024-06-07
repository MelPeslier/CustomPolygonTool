shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = vec2(UV.x, 1.0 - UV.y) * 2.0 - 1.0;
	float pct = pow(uv.y, 2.0);
	COLOR.rgb = vec3(pct);
	COLOR.a = step(uv.y, 0.0) * (1.0-uv.y);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
