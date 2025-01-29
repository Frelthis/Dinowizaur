extends Node2D


func _on_changeFlightPath(path:String, body: PathFollow2D):
	var NewPath : Path2D = get_node("Path_"+String(path))
	body.get_parent().remove_child(body)
	body.progress = 0
	NewPath.add_child.call_deferred(body)
