extends Control

@onready var high_score = $MC/HB/HighScoreLabel

func _ready():
	high_score.text = str( GameManager.get_high_score())

func _process(delta):
	if Input.is_action_pressed("fly"):
		GameManager.load_game_scene()
