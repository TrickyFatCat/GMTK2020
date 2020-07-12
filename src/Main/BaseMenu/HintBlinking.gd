extends Label

onready var blinkSound: AudioStreamPlayer = $BlinkSound


func _on_BlinkTimer_timeout() -> void:
	visible = !visible
	blinkSound.play()
	


func _ready() -> void:
	TransitionScreen.connect("screen_opened", $BlinkTimer, "start")
