extends Weapon

@export var firerate: float = .1
@export var damage: float = .5

func _ready():
	var loading = main.find_child("Bullet State Machine")
	bullet = loading.current_state.bullet
	pass 



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
