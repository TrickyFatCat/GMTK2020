extends Camera2D

var grid_position: Vector2 = Vector2.ZERO

onready var cameraShaker : Node = $CameraShaker


func _ready() -> void:
# warning-ignore:return_value_discarded
	Events.connect("player_took_damage", self, "shake_on_damage")


func shake_on_damage() -> void:
	cameraShaker.start(0.2, 100, 2)
