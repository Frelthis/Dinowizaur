extends Weapon

@export var firerate: float = .4
@export var damage: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		if %cooldown.is_stopped():
			%cooldown.start(firerate)
			shoot()

func shoot():
	var instance = bullet.instantiate()
	var instance2 = bullet.instantiate()
	instance.direction = rotation
	instance2.direction = rotation
	instance.spawnPos.x = global_position.x +10
	instance2.spawnPos.x = global_position.x -10
	instance.spawnPos.y = global_position.y -20
	instance2.spawnPos.y = global_position.y -20
	instance.spawnRotation = rotation
	instance2.spawnRotation = rotation
	main.add_child.call_deferred(instance)
	main.add_child.call_deferred(instance2)
