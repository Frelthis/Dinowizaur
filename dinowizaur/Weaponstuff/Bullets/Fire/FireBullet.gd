 
extends CharacterBody2D

@export var Speed = 1500.0

var direction: float
var spawnPos: Vector2
var spawnRotation: float
var max_range := 300.0
var _travelled_distance = 0.0
var bullet = load("res://Weaponstuff/Bullets/Fire/FireBullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = spawnPos
	global_rotation = spawnRotation
	direction = PI/360 * randf_range(-30,30)


func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction)
	move_and_slide()
	
	var distance: float
	distance = Speed * delta
	
	_travelled_distance += distance
	if _travelled_distance > max_range:
		#hide()
		#set_process(false)
		queue_free()
		pass


func _on_area_2d_body_entered(body):
	queue_free()
