 
extends CharacterBody2D

@export var Speed = 2000.0

var direction: float
var spawnPos: Vector2
var spawnRotation: float
var max_range := 2000.0
var _travelled_distance = 0.0
var damage = 1


func _ready():
	global_position = spawnPos
	global_rotation = spawnRotation


func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction)
	move_and_slide()
	
	var distance: float
	distance = Speed * delta
	
	_travelled_distance += distance
	if _travelled_distance > max_range:
		queue_free()


func _on_area_2d_area_entered(area):
	queue_free()
	
func _on_area_2d_body_entered(body):
	queue_free()


func get_damage_amount() -> int:
	return damage
