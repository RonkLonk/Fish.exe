extends CharacterBody2D

@export var speed = 100
@export var spawn_x = 350
@export var spawn_y	= 350
@onready var _animated_sprite = $PlayerAnimations

func _ready():
	# Set the player's position on spawn
	self.position = Vector2(spawn_x, spawn_y) 
	
#move player based on diectional input
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _process(_delta):
	# flip horizontally to face direction of movement
	if Input.is_action_pressed("ui_left"):
		_animated_sprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.flip_h = false

	# play fisherman_walk animation while any directional input detected
	if Input.is_action_pressed("ui_right") or \
		Input.is_action_pressed("ui_left") or \
		Input.is_action_pressed("ui_up") or \
		Input.is_action_pressed("ui_down"):
			_animated_sprite.play("fisherman_walk")
	else:
		_animated_sprite.play("fisherman_idle")

func _physics_process(delta):
	get_input()
	move_and_slide()
