extends Node2D

@export var dev_state: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func spawn_tracker(position: Vector2) -> void:
	'''
	add_sibling(
			preload("res://systems/godot_deltarune_bullethell_system/bullet_stage/bullets/tracker_bullet.tscn").instantiate()
			)
	'''
	var tracker_scene = preload("res://systems/godot_deltarune_bullethell_system/bullet_stage/bullets/tracker_bullet.tscn").instantiate()
	tracker_scene.position = position
	add_sibling(tracker_scene)
	pass

func spawn_shreader() -> void:
	pass

func spawn_tears() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (dev_state):
		if randi_range(0,10) == 0:
			pass
	pass
