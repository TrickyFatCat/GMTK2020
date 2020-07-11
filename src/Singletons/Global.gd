extends Node

var player: Player
var player_hitpoints: int


func deactivate_player() -> void:
	player.is_active = false


func activate_player() -> void:
	player.is_active = true
