extends Node
class_name Bullet_State_Machine

@export var initial_state: State

@export var current_state: State
var states: Dictionary = {}


func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
	
	var power = get_tree().get_root().get_node("Main/Player/PowerupSignals")
	power.Bullet_Pickedup.connect(_pickedup)


func _process(delta):
	if current_state:
		current_state.Update(delta)


func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)


func on_child_transition(state, new_state_name):
	print(1)
	if state != current_state:
		print(2)
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print(3)
		return
	
	if current_state:
		print(4)
		current_state.Exit()
	new_state.Enter()
	
	current_state = new_state


func _pickedup(new_change: String):
	print("changing bullet")
	var new_state = states.get(new_change.to_lower())
	if !new_state:
		print("bad bullet state")
		return
	on_child_transition(current_state,new_change)
