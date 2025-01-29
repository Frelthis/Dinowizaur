extends CharacterBody2D
class_name Enemy

@onready var main = get_tree().get_root().get_node("Main")
@onready var player = get_tree().get_nodes_in_group("player")[0]
@export var health = 2
var SPEED = 150
var enemyBullet = preload("res://Enemy/EnemyBulletDown.tscn")
var enemyBulletAimed = preload("res://Enemy/enemy_bullet_aimed.tscn")
var powerup = preload("res://Weaponstuff/PowerUps/power_up.tscn")
var damage = 1
var fireRate = 1.5 #seconds

func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body: Node2D):
	#if body.get_parent().has_method("get_damage_amount"):
		#var node = body.get_parent() as Node2D
		#health -= node.damage
	#if health <= 0:
		#var ui: Label = get_tree().get_root().get_node("Main").find_child("Score")
		#ui.score += 100
		#ui.text = "Score: %s" % ui.score
		#if randi() % 10:
			#drop_power_up()
		queue_free()

func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().has_method("get_damage_amount"):
		health -= area.get_parent().damage
	if health <= 0:
		score()
		if randi_range(0,10) == 1:
			if get_tree().get_root().get_node("Main").find_child("PowerUpTimer").is_stopped():
				get_tree().get_root().get_node("Main").find_child("PowerUpTimer").start()
				drop_power_up()
		queue_free()


func get_damage_amount() -> int:
	return damage

func drop_power_up():
	var Pu = powerup.instantiate()
	Pu.spawnPos.x = global_position.x
	Pu.spawnPos.y = global_position.y
	get_tree().get_root().get_node("Main").add_child.call_deferred(Pu)

func score():
	var ui: Label = get_tree().get_root().get_node("Main").find_child("Score")
	ui.score += 100
	ui.text = "Score: %s" % ui.score

#this should be overwritten by super when creating an enemy type
func _on_fire_rate_timeout():
	#shoot_down()
	aim_and_shoot()
	$FireRate.start(fireRate)

func shoot_down():
	var NewBullet = enemyBullet.instantiate()
	NewBullet.spawnPos = global_position
	main.add_child.call_deferred(NewBullet)

func aim_and_shoot():
	var NewBullet = enemyBulletAimed.instantiate()
	NewBullet.spawnPos = global_position
	main.add_child.call_deferred(NewBullet)
