extends Node2D

@export var angle: float
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
	# surface area / number of bullets in a row = the distance between the bullet spawn areas 
	var distance_between_bullets = surface_length_of_emission / bullets_emitted
	# start position = position of bullet spray - surface length/ 2
	# accounting for angle 
	# trigonometry time
	#  -  
	'''
	the start point 
	center of line = position
	start of line = vector of angle with length of  
	'''

	var start_position: Vector2 = Vector2(
		position.x + cos(angle-PI/2)*surface_length_of_emission / 2,
		position.y + sin(angle-PI/2)*surface_length_of_emission / 2 
	)

	#diff vector 
	var diff_vector: Vector2 = -Vector2(
		cos(angle-PI/2)*distance_between_bullets,
		sin(angle-PI/2)*distance_between_bullets,
	)
	
	var ref_vector = Vector2(start_position)
	
	#print("start position", start_position)
	
	# for each point: spawn  
	# 	reference vector push right by distance 
	for number in range(bullets_emitted):
		var bullet_emittor = preload("res://systems/godot_deltarune_bullethell_system/bullet_stage/bullets/bullet.tscn")
		var bullet_instance = bullet_emittor.instantiate()
		bullet_instance.set("position",Vector2(ref_vector))
		bullet_instance.set("direction",Vector2.from_angle(angle))
		
		add_sibling(bullet_instance)
		#print("index: ",number,ref_vector)
		
		ref_vector += diff_vector
		pass
	
	print("fire..",volleys_fired)
	volleys_fired += 1;


func _on_timer_timeout() -> void:
	fire()
	pass # Replace with function body.
