extends Node2D


@export var starts_facing_soul: bool = false
@export var chaser: bool = true
@export var speed: int = 500
@onready var soul = get_node("../soul")
@export var health = 100;
#@export var follows = false
 

var direction: Vector2;

func change_direction_to_soul():
	var angle_to_soul = get_angle_to(soul.position)
	direction = Vector2.from_angle(angle_to_soul)
	direction = direction.normalized()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if starts_facing_soul:
		change_direction_to_soul()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	position += direction * speed * delta
	pass


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "soul":
		#print("hit...",body.name)
		soul.hurt()
		queue_free()
		pass
	if position.distance_to(Vector2(0,0)) > 1000:
		queue_free()
	pass # Replace with function body.
