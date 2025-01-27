extends CharacterBody2D

@export var health = 5
@export var SPEED = 300.0
var enemyBullet = preload("res://Enemy/EnemyBullet.tscn")
var damage = 1

func _physics_process(delta):
	pass

func _on_area_2d_body_entered(body):
	pass


func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		health -= node.damage
	if health == 0:
		var ui: Label = get_tree().get_root().get_node("Main").find_child("Score")
		ui.score += 100
		ui.text = "Score: %s" % ui.score
		queue_free()

func aim_and_shoot():
	var NewBullet = enemyBullet.instantiate()
	NewBullet.global_position = global_position
	#velocity and direction
	get_parent().add_child(NewBullet)

func get_damage_amount() -> int:
	return damage
