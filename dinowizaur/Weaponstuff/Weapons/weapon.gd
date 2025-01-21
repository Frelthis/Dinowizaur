extends Node2D
class_name Weapon

@onready var main = get_tree().get_root().get_node("Main")
@onready var bullet = load("res://Weaponstuff/Bullets/BasicBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_pressed("shoot"):
		#if $cooldown.is_stopped():
			#shoot()
#
#
#func shoot():
	#var instance = bullet.instantiate()
	#instance.direction = rotation
	#instance.spawnPos = global_position
	##instance.spawnRotation = rotation
	#main.add_child.call_deferred(instance)
	#$cooldown.start()
