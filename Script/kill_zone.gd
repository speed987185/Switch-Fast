extends Area2D

@onready var dyingtime: Timer = $dyingtime



func _on_body_entered(_body: Node2D) -> void:
	print(" you died silly")
	dyingtime.start()
	


func _on_dyingtime_timeout() -> void:
	get_tree().reload_current_scene()
	
