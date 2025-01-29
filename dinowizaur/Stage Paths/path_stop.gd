extends Area2D
class_name Path_Stop


@export var PATH_ID: String
signal changePath


func _ready():
	pass #can random?

#for area2d
func _on_area_entered(area):
	#if !area.get_parent().get_parent().atPathStop:
		#area.get_parent().get_parent().atPathStop = true
		#emit_signal("changePath", PATH_ID, area.get_parent().get_parent())
		pass

#for characterbody
func _on_body_entered(body):
	if !body.get_parent().atPathStop:
		body.get_parent().atPathStop = true
		changePath.emit(PATH_ID, body.get_parent())
