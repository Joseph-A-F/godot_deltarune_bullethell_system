extends Node

const PATH = "user://window_config.cfg"

var window_size := Vector2i(800,800)
var window_position := Vector2i(200,200)
var window_mode := DisplayServer.WINDOW_MODE_WINDOWED
var window_screen := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var config_file = ConfigFile.new()
	if config_file.load(PATH) != OK:
		return
		
	print("loading window dimensions")
	
	window_size = config_file.get_value("window","size",window_size)
	DisplayServer.window_set_size(window_size)
	
	window_mode = config_file.get_value("window","mode",window_mode)
	DisplayServer.window_set_mode(window_mode)
	
	window_position = config_file.get_value("window","position",window_size)
	DisplayServer.window_set_position(window_position)
	
	window_screen = config_file.get_value("window","monitor",window_size)
	DisplayServer.window_set_current_screen(window_screen)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func save_config():
	var config_file = ConfigFile.new()
	config_file.set_value("window","size",DisplayServer.window_get_size())
	config_file.set_value("window","position",DisplayServer.window_get_position())
	config_file.set_value("window","mode",DisplayServer.window_get_mode())
	config_file.set_value("window","monitor",DisplayServer.window_get_current_screen())
	config_file.save(PATH)

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("saving window configuration....")
		save_config()
	if what == NOTIFICATION_PREDELETE:
		print("saving window configuration....")
		save_config()
