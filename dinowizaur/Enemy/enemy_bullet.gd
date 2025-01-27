 
extends CharacterBody2D

@export var Speed = 1000.0

var direction: float
var spawnPos: Vector2
var spawnRotation: float
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = spawnPos
	global_rotation = spawnRotation


func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction)
	move_and_slide()
	pass


func _on_area_2d_body_entered(body):
	
	queue_free()


func get_damage_amount() -> int:
	return damage
