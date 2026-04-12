extends Control

var button_type = null
@onready var click: AudioStreamPlayer2D = $click



func _on_play_pressed() -> void:
	button_type = "play"
	click.play()
	$FadeTransition.show()
	$FadeTransition/fade_timer.start()
	$FadeTransition/AnimationPlayer.play("fade_in")
	


func _on_lvl_pressed() -> void:
	button_type = "lvl"
	$FadeTransition.show()
	$FadeTransition/fade_timer.start()
	$FadeTransition/AnimationPlayer.play("fade_in")
	click.play()


func _on_quit_pressed() -> void:
	click.play()
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "play":
		get_tree().change_scene_to_file("res://Scenes/lvl1.tscn")
	elif button_type == "lvl":
		get_tree().change_scene_to_file("res://Scenes/level_select_menu.tscn")
	
