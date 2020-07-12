extends GameLevel


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		TransitionScreen.start_transition()
		get_node("MenuCanvas/Hint/BlinkSound").stop()
		get_node("StartSound").play()
