shader_type canvas_item;

uniform float tex_tiling = 1.0;
uniform vec2 tex_size = vec2(128.0);
uniform sampler2D main_sampler : hint_default_black, repeat_enable;

group_uniforms SDF;
uniform float use_sdf : hint_range(0.0, 1.0, 1.0) = 1.0;
uniform float sdf_aim : hint_range(0.0, 1000.0, 0.1) = 500.0;
uniform vec3 sdf_color : source_color;

group_uniforms BackBuffer;
uniform float use_back_buffer : hint_range(0.0, 1.0, 1.0) = 1.0;
uniform sampler2D back_buffer_s : hint_screen_texture;


varying vec2 world_pos; // Keep the variable for the fragment shader


void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy; // Get world position
}


void fragment() {
	// * Get SDF from occluders *
	vec2 sdf_pos = screen_uv_to_sdf(SCREEN_UV);
	float sdf_value = texture_sdf(sdf_pos);
	vec4 original_tex = texture(TEXTURE, UV);

	// * Get world uv tiled *
	vec2 tex_uv = tex_tiling / tex_size;
	vec2 world_uv = tex_uv * world_pos;
	vec2 uv = world_uv;
	vec4 final_tex = vec4( vec3(0.0), original_tex.a);

	// * Main texture *
	vec4 main_tex = texture(main_sampler, uv);

	// * Mix outer elements from back buffer *
	// TODO ______________ Add variations ? like a noise and it makes it smoothly mix or not
	vec4 back_buffer_tex = texture(back_buffer_s, SCREEN_UV);
	float bb_is_black = step(back_buffer_tex.r, 0.1) * step(back_buffer_tex.g, 0.1) * step(back_buffer_tex.b, 0.1);
	float bb_pct = mix(1.0, bb_is_black * back_buffer_tex.a, use_back_buffer);
	main_tex = mix(back_buffer_tex, main_tex, bb_pct );

	float inner_sdf = -sdf_value * sdf_aim / 10000.0 ;
	float sdf_pct = mix(1.0, min(inner_sdf, 1.0), use_sdf);
	final_tex.rgb = mix(sdf_color, main_tex.rgb, sdf_pct ); // Add result to the final texture output

	COLOR = final_tex;
}


