extends Control

@onready var game_over = $GameOverLabel
@onready var press_space = $PressSpaceLabel
@onready var timer = $Timer

var _can_press_space : bool = false

func _ready():
	GameManager.on_game_over.connect(on_game_over)
	
func _process(delta):
	if _can_press_space:
		if Input.is_action_pressed("fly"):
			GameManager.load_main_scene()
			
func _on_timer_timeout():
	run_sequence()

func on_game_over():
	show()
	timer.start()

func run_sequence():
	game_over.hide()
	press_space.show()
	_can_press_space = true
