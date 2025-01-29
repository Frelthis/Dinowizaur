extends PathFollow2D

@export var atPathStop = false
@export var speed: int

func _ready():
	var enemy = get_children()
	speed = enemy[0].SPEED
	pass # Replace with function body.



func _process(delta):
	set_progress(get_progress() + speed * delta)
	if progress_ratio > .5:
		atPathStop = false
	pass
