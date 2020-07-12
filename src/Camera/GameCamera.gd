extends Camera2D

var grid_position: Vector2 = Vector2.ZERO

onready var cameraShaker : Node = $CameraShaker


func _ready() -> void:
# warning-ignore:return_value_discarded
	Events.connect("player_took_damage", self, "shake_on_damage")
	Events.connect("controls_jumbled", self, "shake_on_jumble")


func shake_on_damage() -> void:
	cameraShaker.start(0.3, 100, 2.5)

func shake_on_jumble() -> void:
	cameraShaker.start(0.5, 250, 3, 1)
