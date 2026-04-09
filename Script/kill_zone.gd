extends Area2D

@onready var dyingtime: Timer = $dyingtime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D




func _on_body_entered(_body: Node2D) -> void:
	print(" you died silly")
	
	_body.get_node("CollisionShape2D").queue_free()
	dyingtime.start()
	


func _on_dyingtime_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	
