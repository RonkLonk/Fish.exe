extends CharacterBody2D

@export var speed = 100
@export var buoyancy_acceleration = 1
@export var spawn_x = 350
@export var spawn_y	= 350

@onready var camera = $Camera2D
@onready var _animated_sprite = $DivingPlayerAnimation
@onready var _can_move
@onready var buoyancy
@onready var max_buoyancy
@onready var SPEAR = preload("res://Scenes/spear_projectile.tscn")


func _ready():
	# Set the player's position on spawn
	self.position = Vector2(spawn_x, spawn_y) 
	self._can_move = true
	self.buoyancy = 0 #neutrally buoyant
	self.max_buoyancy = 50
	
func _process(_delta):
	# flip horizontally by inverting scale.x when the cursor is on the other half of the screen
	var cursor_angle = rad_to_deg(get_local_mouse_position().angle())
	if (cursor_angle < -90) or (cursor_angle > 90):
		self.scale.x = self.scale.x * -1

	# play player_swim animation constantly
	_animated_sprite.play("player_swim")

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func get_input():
	if _can_move:
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
			if abs(buoyancy) <= max_buoyancy:
				buoyancy += input_direction.y * buoyancy_acceleration
			else:
				buoyancy = max_buoyancy * input_direction.y
		velocity.x = input_direction.x * speed
		velocity.y = buoyancy
	else:
		velocity = Vector2(0, buoyancy)
