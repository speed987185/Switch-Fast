extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score_counter: Node = %ScoreCounter


func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
	
