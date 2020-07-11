extends State

onready var player: Player = Global.player


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	Global.player.is_active = false


func exit() -> void:
	pass
