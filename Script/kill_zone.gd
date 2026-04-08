extends Area2D

@onready var dyingtime: Timer = $dyingtime



func _on_body_entered(_body: Node2D) -> void:
	print(" you died silly")
	Engine.time_scale = 0.5
	_body.get_node("CollisionShape2D").queue_free()
	dyingtime.start()
	


func _on_dyingtime_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	
