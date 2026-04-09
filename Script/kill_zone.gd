extends Area2D

@onready var dyingtime: Timer = $dyingtime

@onready var game_manager: Node = %GameManager



func _on_body_entered(body: Node2D) -> void:
	
	body.get_node("CollisionShape2D").queue_free()
	dyingtime.start()



func _on_dyingtime_timeout() -> void:
	get_tree().reload_current_scene()
