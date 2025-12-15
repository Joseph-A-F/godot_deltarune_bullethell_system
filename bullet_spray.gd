extends Node2D

@export var direction: float
@export var surface_length_of_emission: int
@export var bullets_emitted: int
@export var volleys: int
@export var cooldown_timer: float
@export var bullet_type: Resource
var volleys_fired = 0;
var delta: int;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delta = delta
	pass

# Bullet Fire
func fire():
	if bullets_emitted == 0:
		bullets_emitted = 1
	# 
	print("fire..",volleys_fired)
	volleys_fired += 1;


func _on_timer_timeout() -> void:
	fire()
	pass # Replace with function body.
