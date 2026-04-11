extends Node2D

#buttons
@onready var lvl_1: Button = %lvl1
@onready var lvl_2: Button = %lvl2
@onready var lvl_3: Button = %lvl3
@onready var lvl_4: Button = %lvl4
@onready var lvl_5: Button = %lvl5
@onready var lvl_6: Button = %lvl6

#lockedcolor
@onready var lvl_1_locked: ColorRect = $lvl1_locked
@onready var lvl_2_locked: ColorRect = $lvl2_locked
@onready var lvl_3_locked: ColorRect = $lvl3_locked
@onready var lvl_4_locked: ColorRect = $lvl4_locked
@onready var lvl_5_locked: ColorRect = $lvl5_locked
@onready var lvl_6_locked: ColorRect = $lvl6_locked

#locksprite
@onready var lock_2: Sprite2D = $Locks/lock2
@onready var lock_3: Sprite2D = $Locks/lock3
@onready var lock_4: Sprite2D = $Locks/lock4
@onready var lock_5: Sprite2D = $Locks/lock5
@onready var lock_6: Sprite2D = $Locks/lock6


func _ready() -> void:
	lvl_1.grab_focus()
	
	#level2
	if LevelCore.lvl1_completed == true:
		lvl_2_locked.visible = false
		lock_2.visible = false
	if LevelCore.lvl1_completed == false:
		lvl_2_locked.visible = true
		lock_2.visible = true
		
	#level3
	if LevelCore.lvl2_completed == true:
		lvl_3_locked.visible = false
		lock_3.visible = false
	if LevelCore.lvl2_completed == false:
		lvl_3_locked.visible = true
	
		#level4
	if LevelCore.lvl3_completed == true:
		lvl_4_locked.visible = false
		lock_4.visible = false
	if LevelCore.lvl3_completed == false:
		lvl_4_locked.visible = true
		
		#level5
	if LevelCore.lvl4_completed == true:
		lvl_5_locked.visible = false
		lock_5.visible = false
	if LevelCore.lvl4_completed == false:
		lvl_5_locked.visible = true
		
		#level6
	if LevelCore.lvl5_completed == true:
		lvl_6_locked.visible = false
		lock_6.visible = false
	if LevelCore.lvl5_completed == false:
		lvl_6_locked.visible = true
		



func _on_lvl_1_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		
		
func _on_lvl_2_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		null
	if LevelCore.lvl1_completed == true:
		get_tree().change_scene_to_file("res://Scenes/lvl2.tscn")
	
