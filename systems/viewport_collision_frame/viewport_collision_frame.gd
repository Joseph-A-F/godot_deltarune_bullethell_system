extends StaticBody2D

@onready var camera := get_viewport().get_camera_2d()

@export var wall_thickness := 64.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var view_size = get_viewport().get_visible_rect().size * camera.zoom
	var half_view_size = view_size * 0.5
	
	
	($top.shape as RectangleShape2D).size = Vector2(
		view_size.x + wall_thickness * 2,wall_thickness
	)
	$top.position = Vector2(0,-half_view_size.y - wall_thickness * 0.5);
	
	($bottom.shape as RectangleShape2D).size = Vector2(
		view_size.x + wall_thickness * 2,wall_thickness
	)
	$bottom.position = Vector2(0,+half_view_size.y + wall_thickness * 0.5);
	
	($left.shape as RectangleShape2D).size = Vector2(
		wall_thickness,view_size.y + wall_thickness * 2
	)
	$left.position = Vector2(-half_view_size.x-wall_thickness*0.5,0);
	
	($right.shape as RectangleShape2D).size = Vector2(
		wall_thickness,view_size.y + wall_thickness * 2
	)
	$right.position = Vector2(+half_view_size.x+wall_thickness*0.5,0);
	
	#print("current size",view_size)
	#scale = window_scale
	pass
