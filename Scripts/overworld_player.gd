extends CharacterBody2D

@export var speed = 100
@export var spawn_x = 350
@export var spawn_y	= 350
@onready var camera = $Camera2D
@onready var _animated_sprite = $OverworldPlayerAnimation
@onready var _can_move

func _ready():
	# Set the player's position on spawn
	self.position = Vector2(spawn_x, spawn_y) 
	self._can_move = true
	
func _process(_delta):
	# flip horizontally to face direction of movement
	#if Input.is_action_pressed("ui_left"):
	#	_animated_sprite.flip_h = true
	#if Input.is_action_pressed("ui_right"):
	#	_animated_sprite.flip_h = false

	# play fisherman_walk animation if any directional input detected
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("player_walk_right")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("player_walk_left")
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("player_walk_up")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("player_walk_down")
	else:
		_animated_sprite.play("player_idle")

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	#move player based on diectional input
func get_input():
	if _can_move:
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_direction * speed
	else:
		velocity = Vector2(0, 0)
