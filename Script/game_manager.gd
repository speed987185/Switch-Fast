extends Node

var attempts = 1
var score = 0
@onready var point_score: Label = $Points
@onready var attempt_score: Label = $Attempts

func add_point():
	score += 1
	point_score.text = " You collected " + str(score) + " coins "
	
	
	
	
func atempts_count():
	attempts += 1
	attempt_score.text = " attempts :" + str(attempts)
	
	
