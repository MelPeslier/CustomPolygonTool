@tool
class_name CPT_Setup_Helper
extends Node2D

const ELEMENTS_TO_MIX : String = "ElementsToMix"
const DARK_MASKS : String = "DarkMasks"
const ELEMENTS_BUFFER : String = "ElementsBuffer"

const ELEMENTS_TO_MIX_Z_INDEX : int = -4095
const DARK_MASKS_Z_INDEX : int = -4096
const ELEMENTS_BUFFER_Z_INDEX : int = -4094

func _ready() -> void:
	if not Engine.is_editor_hint(): return
	
	load_or_create_elements_to_mix()
	load_or_create_dark_masks()
	load_or_create_elements_buffer()
	


func load_or_create_elements_to_mix() -> void:
	var elements_to_mix : Node2D = get_node_or_null(ELEMENTS_TO_MIX)
	if elements_to_mix : return
	elements_to_mix = Node2D.new()
	elements_to_mix.name = ELEMENTS_TO_MIX
	elements_to_mix.z_index = ELEMENTS_TO_MIX_Z_INDEX
	add_child.call_deferred(elements_to_mix)
	set_custom_owner.call_deferred(elements_to_mix)
	

func load_or_create_dark_masks() -> void:
	var dark_masks : Node2D = get_node_or_null(DARK_MASKS)
	if dark_masks : return
	dark_masks = Node2D.new()
	dark_masks.name = DARK_MASKS
	dark_masks.z_index = DARK_MASKS_Z_INDEX
	add_child.call_deferred(dark_masks)
	set_custom_owner.call_deferred(dark_masks)

func load_or_create_elements_buffer() -> void:
	var elements_buffer : BackBufferCopy = get_node_or_null(ELEMENTS_BUFFER)
	if elements_buffer : return
	elements_buffer = BackBufferCopy.new()
	elements_buffer.copy_mode = BackBufferCopy.COPY_MODE_VIEWPORT
	elements_buffer.name = ELEMENTS_BUFFER
	elements_buffer.z_index = ELEMENTS_BUFFER_Z_INDEX
	add_child.call_deferred(elements_buffer)
	set_custom_owner.call_deferred(elements_buffer)


func set_custom_owner(_node : Variant) -> void:
	_node.owner = get_parent()
