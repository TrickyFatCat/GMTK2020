extends Node

const FLOOR_NORMAL: Vector2 = Vector2.ZERO

var player: Player


func deactivate_player() -> void:
	player.is_active = false


func activate_player() -> void:
	player.is_active = true
