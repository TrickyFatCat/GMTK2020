extends GameLevel


func _ready() -> void:
	TransitionScreen.connect("screen_closed", Global, "reset_wave_count")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		TransitionScreen.start_transition()
