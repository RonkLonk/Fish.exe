extends Node2D

@onready var diving_cursor = load("res://Assets/Cursors/diving_cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(diving_cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
