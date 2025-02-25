@tool
class_name CPT_Curve2D
extends Curve2D
signal points_changed


func add_point(_position : Vector2, _in := Vector2.ZERO, _out := Vector2.ZERO, _index : int = -1 ) -> void:
	print("add_point")
	super(_position, _in, _out, _index)
	points_changed.emit()

func remove_point(_index: int) -> void:
	print("remove_point")
	super(_index)
	points_changed.emit()

func clear_points() -> void: # OK
	print("clear_points")
	super()
	points_changed.emit()

func set_point_in(_index: int, _position: Vector2) -> void: # OK
	print("point_in")
	super(_index, _position)
	points_changed.emit()

func set_point_out(_index: int, _position: Vector2) -> void: # OK
	print("point_out")
	super(_index, _position)
	points_changed.emit()

func set_point_position(_index: int, _position: Vector2) -> void:
	print("point_position")
	super(_index, _position)
	points_changed.emit()
