extends CharacterBody2D

signal on_plane_die

const GRAVITY: float = 1900.0
const POWER : float = -400.0


@onready var animation_player = $AnimationPlayer
@onready var animated_sprite = $AnimatedSprite2D

var _dead :bool = false

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	
	if is_on_floor():
		die()
			
func fly() -> void:	
	
	if Input.is_action_pressed("fly"):
		velocity.y = POWER 	
		animation_player.play("fly")

func die() -> void:
	if _dead:
		return
	_dead = true
	animated_sprite.stop()
#	on_plane_die.emit()
	GameManager.on_game_over.emit()
	set_physics_process(false)
	
