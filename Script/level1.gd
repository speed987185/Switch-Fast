extends Node2D

@onready var player1: Node2D = $Player      
@onready var player2: Node2D = $Player2
@onready var timer: Timer = $Timer

var active_player: Node2D

func _ready():
	active_player = player1
	
	# player 1
	player1.visible = true
	player1.process_mode = Node.PROCESS_MODE_INHERIT
	enable_camera(player1, true)
	
	# player_2 hiden
	player2.visible = false
	player2.process_mode = Node.PROCESS_MODE_DISABLED
	enable_camera(player2, false)
	
	# Timer of 5 sec
	timer.wait_time = 1.5
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if active_player == player1:
			switch_to_player2()

func switch_to_player2():
	var old_pos = player1.global_position
	
	# Hide and stop player1
	player1.visible = false
	player1.process_mode = Node.PROCESS_MODE_DISABLED
	enable_camera(player1, false)
	
	#  teleport player_2 
	player2.global_position = old_pos
	player2.visible = true
	player2.process_mode = Node.PROCESS_MODE_INHERIT
	enable_camera(player2, true)
	
	active_player = player2
	timer.start()

func _on_timer_timeout():
	var old_pos = player2.global_position
	
	# Hide and stop player_2
	player2.visible = false
	player2.process_mode = Node.PROCESS_MODE_DISABLED
	enable_camera(player2, false)
	
	# Show player1 at position of player2
	player1.global_position = old_pos
	player1.visible = true
	player1.process_mode = Node.PROCESS_MODE_INHERIT
	enable_camera(player1, true)
	
	active_player = player1

# make camera process stable
func enable_camera(player_node: Node2D, enable: bool):
	var cam = player_node.get_node_or_null("Camera2D")
	if cam:
		cam.enabled = enable
	else:
		cam = player_node.get_node_or_null("Camera")
		if cam:
			cam.enabled = enable
			
func _fade():
		$FadeTransition/AnimationPlayer.play("fade_out")
	
	
	
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	$FadeTransition.show()
	$FadeTransition/fade_timer.start()
	$FadeTransition/AnimationPlayer.play("fade_in")
	get_tree().change_scene_to_file("res://Scenes/lvl2.tscn")
	
	
	
