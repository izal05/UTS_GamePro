extends Node2D

var p1_score = 0
var p2_score = 0
@onready var p_1_score: Label = $scores/p1_score
@onready var p_2_score: Label = $scores/p2_score

const PLAYER_1 = preload("res://scenes/player_1.tscn")
const PLAYER_2 = preload("res://scenes/player_2.tscn")

@onready var gameoverscreen: Control = $gameoverscreen
@onready var wintext: Label = $gameoverscreen/wintext


var score_limit = 3

func _process(delta):
	if p1_score == 3:
		get_tree().paused = true
		gameoverscreen.visible = true
		wintext.text = "Player 1 Has Won"

	if p2_score == 3:
		get_tree().paused = true
		gameoverscreen.visible = true
		wintext.text = "Player 2 Has Won"

func increment_p1_score():
	p1_score += 1
	p_1_score.text = "P1: " + str(p1_score)

func increment_p2_score():
	p2_score += 1
	p_2_score.text = "P2: " + str(p2_score)
	

func respawn_p1():
	var p1 = PLAYER_1.instantiate()
	p1.position = Vector2(randf_range(65, 1097), randf_range(50, 606))
	add_child(p1)
	

func respawn_p2():
	var p2 = PLAYER_2.instantiate()
	p2.position = Vector2(randf_range(65, 1097), randf_range(50, 606))
	add_child(p2)


func _on_restarbutton_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
