extends State

onready var hitpoints: HitPoints = get_node("../../EnemyHitpoints")


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	hitpoints.is_invulnerable = true


func exit() -> void:
	hitpoints.is_invulnerable = false
