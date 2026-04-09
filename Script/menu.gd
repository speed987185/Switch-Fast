extends Control

var button_type = null


func _on_play_pressed() -> void:
	button_type = "play"
	$FadeTransition.show()
	$FadeTransition/fade_timer.start()
	$FadeTransition/AnimationPlayer.play("fade_in")
	


func _on_lvl_pressed() -> void:
	button_type = "lvl"
	$FadeTransition.show()
	$FadeTransition/fade_timer.start()
	$FadeTransition/AnimationPlayer.play("fade_in")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "play":
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	elif button_type == "lvl":
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
