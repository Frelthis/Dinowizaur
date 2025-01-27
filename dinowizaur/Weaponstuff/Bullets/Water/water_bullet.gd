
extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Main")
@onready var explosion = load("res://Weaponstuff/Bullets/Water/water_explosion.tscn")

@export var Speed = 2000.0

var direction: float
var spawnPos: Vector2
var spawnRotation: float
var max_range := 800.0
var _travelled_distance = 0.0


# Called when the node enters the scene tree for the first time.
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
		#hide()
		#set_process(false)
		queue_free()
		pass


func _on_area_2d_body_entered(body):
	var instance = explosion.instantiate()
	instance.spawnPos = global_position
	main.add_child.call_deferred(instance)
	queue_free()


func _on_area_2d_area_entered(area):
	var instance = explosion.instantiate()
	instance.spawnPos = global_position
	main.add_child.call_deferred(instance)
	queue_free()
