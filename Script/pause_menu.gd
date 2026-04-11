extends CanvasLayer

func _ready() -> void:
	visible = false
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true

func _on_resume_pressed() -> void:
	visible = false
	
func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()

func _on_menu_pressed() -> void:
	if get_tree(): 
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
