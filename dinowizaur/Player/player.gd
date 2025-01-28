extends CharacterBody2D


@export var SPEED = 400.0
var target_velocity = Vector2.ZERO
var health = 3


func _physics_process(delta):

	var direction = Vector2.ZERO

	var vel = Input.get_vector("move_left","move_right","move_up","move_down")
	direction.x += vel.x
	direction.y += vel.y
	target_velocity.x = direction.x * SPEED
	target_velocity.y = direction.y * SPEED
	velocity = target_velocity
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		health -= node.damage
		var ui: Label = get_tree().get_root().get_node("Main").find_child("Lives")
		ui.text = "Lives: %s" % health
		if health <= 0:
			get_tree().change_scene_to_file("res://start_menu.tscn")


func _on_area_2d_body_entered(body):
	if body.get_parent().has_method("get_damage_amount"):
		var node = body.get_parent() as Node
		health -= node.damage
		var ui: Label = get_tree().get_root().get_node("Main").find_child("Lives")
		ui.text = "Lives: %s" % health
		if health <= 0:
			get_tree().change_scene_to_file("res://start_menu.tscn")
