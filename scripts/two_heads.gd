extends Node2D

# turn off one of the two below and it breaks
@export var await_physics_frame:bool = true
@export var force_raycast_update: bool = true

@onready var left = $Left
@onready var right = $Right
@onready var tick_timer = $TickTimer
@onready var tick_stage: bool = true
@onready var in_progress: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	tick_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _tick() -> void:
	right.position.x += 128
	if (await_physics_frame):
		await get_tree().physics_frame
	assert(not right.is_colliding(force_raycast_update))
	if (await_physics_frame):
		await get_tree().physics_frame
	assert(not left.is_colliding(force_raycast_update))
	
func _tock() -> void:
	left.position.x += 128
	if (await_physics_frame):
		await get_tree().physics_frame
	assert(right.is_colliding(force_raycast_update))
	if (await_physics_frame):
		await get_tree().physics_frame
	assert(left.is_colliding(force_raycast_update))
	
func _on_tick_timer_timeout():
	if in_progress: # do not "recurse"
		return
	in_progress = true
	if (tick_stage):
		_tick()
	else:
		_tock()
	tick_stage = not tick_stage
	in_progress = false
