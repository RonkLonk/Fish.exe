extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	self.hide()


func _on_fishmonger_area_2d_body_entered(body: Node2D) -> void:
	self.show()


func _on_anglers_arcana_area_2d_body_entered(body: Node2D) -> void:
	self.show()
