extends Area2D

@onready var above_head = $AboveHead

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_colliding(force_raycast_update: bool) -> bool:
	if (force_raycast_update):
		above_head.force_raycast_update()
	return above_head.is_colliding()
