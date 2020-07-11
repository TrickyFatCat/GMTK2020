extends AudioStreamPlayer


func _ready() -> void:
	GameManager.connect("game_started", self, "play")
