extends State


func unhandled_input(event: InputEvent) -> void:
	return


func physics_process(delta: float) -> void:
	return


func enter(msg: Dictionary = {}) -> void:
	GameManager.emit_signal("count_started")
	GameManager.startTimer.start()


func exit() -> void:
	return
