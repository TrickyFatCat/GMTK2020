extends State

onready var player: Player = Global.player
onready var sprite: AnimatedSprite = get_node("../../Sprite")


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
#	Global.player.is_active = false
	sprite.animation = "explosion"
	sprite.play()


func exit() -> void:
	Global.player.is_active = false
	pass
