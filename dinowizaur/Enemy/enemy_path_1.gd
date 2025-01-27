extends Path2D

var enemy = preload("res://path_follow_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var newenemy = enemy.instantiate()
	add_child(newenemy)
	%EnemySpawner.start()
	pass # Replace with function body.
