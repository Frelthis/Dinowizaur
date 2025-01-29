extends Node2D


func _on_changeFlightPath(path:String, body: Node2D):
	var NewPath : Path2D = get_node("Path_"+String(path))
	var newOffset = NewPath.curve.get_closest_offset(body.get_node("KinematicBody2D").global_position-NewPath.global_position)
	body.get_parent().remove_child(body)
	NewPath.add_child(body)
	body.offset = newOffset
