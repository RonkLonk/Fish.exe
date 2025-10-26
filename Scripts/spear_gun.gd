extends AnimatedSprite2D

@onready var DIVING_GAME = load("res://Scenes/diving_game.tscn").instantiate()
@onready var SPEAR = load("res://Scenes/spear_projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.play("speargun_loaded")
	
	self.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed('Fire'):
		var spear_instance = SPEAR.instantiate()
		spear_instance.global_position = $Muzzle.global_position
		spear_instance.look_at(get_global_mouse_position())
		get_tree().current_scene.add_child(spear_instance)
