 
extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
@export var Speed = 100.0

var direction: float
var spawnPos: Vector2
var spawnRotation: float
var damage = 1


func _ready():
	global_position = spawnPos
	look_at(player.position)
	rotation_degrees -= 90
	pass


func _physics_process(delta):
	velocity = Vector2(0, Speed).rotated(rotation)
	move_and_slide()
	#print(player.global_position.x)
	#print(player.global_position.y)
	pass


func _on_area_2d_body_entered(body):
	
	queue_free()


func get_damage_amount() -> int:
	return damage


func _on_life_timeout():
	queue_free()
