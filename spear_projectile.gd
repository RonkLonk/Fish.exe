extends Node2D

@export var speed = 300

func _process(delta: float) -> void:
	position += transform.x * speed * delta
