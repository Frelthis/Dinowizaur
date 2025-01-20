 
extends CharacterBody2D

@export var Speed = 2000.0

var direction: float
var spawnPos: Vector2
#var spawnRotation: float
var max_range := 300.0
var _travelled_distance = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = spawnPos
	#global_rotation = spawnRotation


func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction)
	move_and_slide()
	
	var distance: float
	distance = Speed * delta
	
	_travelled_distance += distance
	if _travelled_distance > max_range:
		hide()
		set_process(false)


func _on_area_2d_body_entered(body):
	queue_free()
