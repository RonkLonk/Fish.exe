extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_anglers_arcana_area_2d_body_entered(body: Node2D) -> void:
	self.show()


func _on_return_to_town_pressed() -> void:
	self.hide()
