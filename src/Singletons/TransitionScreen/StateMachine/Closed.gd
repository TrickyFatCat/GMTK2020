extends State


func unhandled_input(event: InputEvent) -> void:
	return


func enter(msg: Dictionary = {}) -> void:
	TransitionScreen.emit_signal("screen_closed")


func exit() -> void:
	return
