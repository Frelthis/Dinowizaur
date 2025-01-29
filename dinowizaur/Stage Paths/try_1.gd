extends Node2D

var enemy = preload("res://Stage Paths/path_follow_1.tscn")

func _on_changeFlightPath(path:String, body: PathFollow2D):
	var NewPath : Path2D = get_node("Path_"+String(path))
	body.get_parent().remove_child(body)
	body.progress = 0
	NewPath.add_child.call_deferred(body)


func _on_enemy_spawner_timeout():
	var newenemy = enemy.instantiate()
	$entrance.add_child(newenemy)
	%EnemySpawner.start()
