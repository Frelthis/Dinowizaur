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
	instance.direction = rotation
	instance.spawnPos = global_position
	#instance.spawnRotation = rotation
	main.add_child.call_deferred(instance)
	$cooldown.start()
