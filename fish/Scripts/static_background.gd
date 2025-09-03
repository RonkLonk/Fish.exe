extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fishmonger_store_entered(body: Node2D) -> void:
	self.texture = load("res://Assets/Backgrounds/fishmonger_store.png")
	self.show()
