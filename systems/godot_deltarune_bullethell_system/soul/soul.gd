extends CharacterBody2D

@export var health: int = 20
@export var durability = 0.3
@export var speed = 600.0 
@export var destructable = true
@export var follows = false
 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"glow_player".play("glow")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	position += input_vector * delta * speed
	
	move_and_slide()
	
	pass

func hurt() -> void:
	#if the animation player isn't still playing hurt  
	$"AnimationPlayer".play("hurt")
	$"glow_player".play("glow_hurt")
	$"glow_player".queue("glow")
	if destructable and !$"AnimationPlayer".is_playing() and !($"AnimationPlayer".current_animation == "hurt"):
		health -= 10
	pass
