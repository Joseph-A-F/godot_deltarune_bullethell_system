extends "res://systems/godot_deltarune_bullethell_system/bullet_stage/bullets/bullet.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	$"AnimatedSprite2D".rotate(-direction.angle())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chaser:
		change_direction_to_soul()
		pass
	super._process(delta)
	pass
