extends Node2D

@export var pipes_scene : PackedScene

@onready var pipe_holder =$PipeHolder
@onready var spawn_u=  $SpawnU 
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer
@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound

func _ready():
	spawn_pipe()
	GameManager.on_game_over.connect(on_game_over)
	GameManager.set_score(0)


func spawn_pipe():
	var y_pos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipes = pipes_scene.instantiate()
	
	new_pipes.position = Vector2(spawn_l.position.x, y_pos)
	pipe_holder.add_child(new_pipes)

func _on_spawn_timer_timeout():
	spawn_pipe()

func on_game_over():
#	GameManager.load_main_scene()
	stop_pipes()
	engine_sound.stop()
	game_over_sound.play()
	
	
func stop_pipes():
	spawn_timer.stop()
	for pipe in pipe_holder.get_children():
		pipe.set_process(false)
