extends Node2D

@onready var _town_background = $TownBackground
@onready var _fishmonger_background = $FishmongerBackground
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fishmonger_store_entered(body: Node2D) -> void:
	self.hide()
