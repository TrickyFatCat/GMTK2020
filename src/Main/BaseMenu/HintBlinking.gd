extends Label


func _on_BlinkTimer_timeout() -> void:
	visible = !visible


func _ready() -> void:
	GameManager.connect("game_started", $BlinkTimer, "start")
