extends CharacterBody2D

@export var health = 2
@export var SPEED = 300.0
var enemyBullet = preload("res://Enemy/EnemyBullet.tscn")
var powerup = preload("res://Weaponstuff/PowerUps/power_up.tscn")
var damage = 1

func _physics_process(delta):
	pass

func _on_area_2d_body_entered(body: Node2D):
	if body.get_parent().has_method("get_damage_amount"):
		var node = body.get_parent() as Node2D
		health -= node.damage
	if health <= 0:
		var ui: Label = get_tree().get_root().get_node("Main").find_child("Score")
		ui.score += 100
		ui.text = "Score: %s" % ui.score
		drop_power_up()
		queue_free()


func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		health -= node.damage
	if health <= 0:
		var ui: Label = get_tree().get_root().get_node("Main").find_child("Score")
		ui.score += 100
		ui.text = "Score: %s" % ui.score
		drop_power_up()
		queue_free()

func aim_and_shoot():
	var NewBullet = enemyBullet.instantiate()
	NewBullet.global_position = global_position
	#velocity and direction
	get_parent().add_child(NewBullet)

func get_damage_amount() -> int:
	return damage

func drop_power_up():
	var Pu = powerup.instantiate()
	Pu.spawnPos.x = global_position.x
	Pu.spawnPos.y = global_position.y
	get_tree().get_root().get_node("Main").add_child.call_deferred(Pu)
	pass
