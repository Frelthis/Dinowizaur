extends Weapon


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		if $cooldown.is_stopped():
			shoot()

func shoot():
	var instance = bullet.instantiate()
	instance.direction = rotation
	instance.spawnPos.x = global_position.x +20
	instance.spawnPos.y = global_position.y
	#instance.spawnRotation = rotation
	var instance2 = bullet.instantiate()
	instance2.direction = rotation
	instance2.spawnPos.x = global_position.x -20
	instance2.spawnPos.y = global_position.y
	#instance2.spawnRotation = rotation
	main.add_child.call_deferred(instance)
	main.add_child.call_deferred(instance2)
	$cooldown.start()
