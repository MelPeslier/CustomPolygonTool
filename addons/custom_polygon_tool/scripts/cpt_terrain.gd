@tool
@icon("res://addons/custom_polygon_tool/icons/cpt_terrain_icon.png")
##Use it to create as many static terrains as you want
##[br] No limitations here
class_name CPT_Terrain
extends CPT

var static_body : StaticBody2D


@export_group("StaticBody2D")
@export var physics_material_override : PhysicsMaterial : set = _set_physics_material_override
@export var constant_linear_velocity := Vector2.ZERO : set = _set_constant_linear_velocity
@export_range(-360.0, 360.0, 0.001, "or_less", "or_greater", "suffix:°/s") var constant_angular_velocity : float = 0.0 : set = _set_constant_angular_velocity
@export_subgroup("CollisionObject2D", "collision_")
@export_flags_2d_physics var collision_layer: int = 1 : set = _set_collision_layer
@export_flags_2d_physics var collision_mask: int = 1 : set = _set_collision_mask

@export_group("LightOccluder2D")
@export_flags_2d_render var occluder_light_mask : int = 1 : set = _set_occluder_light_mask
@export_flags_2d_render var canvas_item_light_mask : int = 1 : set = _set_canvas_item_light_mask
@export_flags_2d_render var canvas_item_visibility_layer : int = 0 : set = _set_canvas_item_visibility_layer


func create_polygons() -> void:
	static_body = StaticBody2D.new()
	add_child(static_body)

	collision_polygon = CollisionPolygon2D.new()
	static_body.add_child(collision_polygon)
	
	polygon = Polygon2D.new()
	static_body.add_child(polygon)
	_update_polygon()
	
	line = Line2D.new()
	add_child(line)
	_update_line()

	light_occluder = LightOccluder2D.new()
	add_child(light_occluder)
	light_occluder.occluder = OccluderPolygon2D.new()
	
	physics_material_override = physics_material_override
	constant_linear_velocity = constant_linear_velocity
	constant_angular_velocity = constant_angular_velocity
	collision_layer = collision_layer
	collision_mask = collision_mask
	polygon_texture = BASE_POLYGON_TEXTURE
	occluder_light_mask = occluder_light_mask
	canvas_item_light_mask = canvas_item_light_mask
	canvas_item_visibility_layer = canvas_item_visibility_layer




#region StaticBody
func _set_physics_material_override(_physics_material_override: PhysicsMaterial) -> void:
	physics_material_override = _physics_material_override
	if not is_inside_tree(): return
	static_body.physics_material_override = physics_material_override

func _set_constant_linear_velocity(_constant_linear_velocity : Vector2) -> void:
	constant_linear_velocity = _constant_linear_velocity
	if not is_inside_tree(): return
	static_body.constant_linear_velocity = constant_linear_velocity

func _set_constant_angular_velocity(_constant_angular_velocity : float) -> void:
	constant_angular_velocity = _constant_angular_velocity
	if not is_inside_tree(): return
	static_body.constant_angular_velocity = constant_angular_velocity

func _set_collision_layer(_collision_layer : int) -> void:
	collision_layer = _collision_layer
	if not is_inside_tree(): return
	static_body.collision_layer = _collision_layer

func _set_collision_mask(_collision_mask : int) -> void:
	collision_mask = _collision_mask
	if not is_inside_tree(): return
	static_body.collision_mask = collision_mask
#endregion

#region LightOccluder
func _set_occluder_light_mask(_occluder_light_mask: int) -> void:
	occluder_light_mask = _occluder_light_mask
	if not is_inside_tree(): return
	light_occluder.occluder_light_mask = occluder_light_mask

func _set_canvas_item_light_mask(_canvas_item_light_mask: int) -> void:
	canvas_item_light_mask = _canvas_item_light_mask
	if not is_inside_tree(): return
	light_occluder.light_mask = canvas_item_light_mask

func _set_canvas_item_visibility_layer(_canvas_item_visibility_layer: int) -> void:
	canvas_item_visibility_layer = _canvas_item_visibility_layer
	if not is_inside_tree(): return
	light_occluder.visibility_layer = canvas_item_visibility_layer
#endregion
