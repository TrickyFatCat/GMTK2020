extends State

onready var sprite: AnimatedSprite = get_node("../../AnimatedSprite")


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	sprite.animation = "explosion"
	sprite.play()


func exit() -> void:
	pass
