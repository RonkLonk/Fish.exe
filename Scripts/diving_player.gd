extends CharacterBody2D

@export var speed = 100
@export var spawn_x = 350
@export var spawn_y	= 350
@onready var camera = $Camera2D
@onready var _animated_sprite = $DivingPlayerAnimation
@onready var _can_move

func _ready():
	# Set the player's position on spawn
	self.position = Vector2(spawn_x, spawn_y) 
	self._can_move = true
	#self.hide()
	
func _process(_delta):
	# flip horizontally by inverting scale.x when the cursor is on the other half of the screen
	var cursor_angle = rad_to_deg(get_local_mouse_position().angle())
	print(cursor_angle)
	if (cursor_angle < -90) or (cursor_angle > 90):
		self.scale.x = self.scale.x * -1

	# play fisherman_walk animation if any directional input detected
	_animated_sprite.play("player_swim")

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
