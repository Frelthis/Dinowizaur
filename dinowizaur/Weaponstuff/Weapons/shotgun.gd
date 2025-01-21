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
	var instance3 = bullet.instantiate()
	var instance4 = bullet.instantiate()
	instance.direction = rotation + (PI/360*8)
	instance2.direction = rotation - (PI/360*8)
	instance3.direction = rotation + (PI/360*20)
	instance4.direction = rotation - (PI/360*20)
	instance.spawnPos.x = global_position.x +10
	instance2.spawnPos.x = global_position.x -10
	instance3.spawnPos.x = global_position.x +20
	instance4.spawnPos.x = global_position.x -20
	instance.spawnPos.y = global_position.y -20
	instance2.spawnPos.y = global_position.y -20
	instance3.spawnPos.y = global_position.y
	instance4.spawnPos.y = global_position.y
	instance.spawnRotation = rotation + (PI/360*8)
	instance2.spawnRotation = rotation - (PI/360*8)
	instance3.spawnRotation = rotation + (PI/360*20)
	instance4.spawnRotation = rotation - (PI/360*20)
	main.add_child.call_deferred(instance)
	main.add_child.call_deferred(instance2)
	main.add_child.call_deferred(instance3)
	main.add_child.call_deferred(instance4)
