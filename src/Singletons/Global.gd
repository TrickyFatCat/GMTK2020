extends Node

const FLOOR_NORMAL: Vector2 = Vector2.ZERO

var player: Player
var waveSpawner: WaveSpawner
var jumbler: Jumbler
var wave_count: int = 0


func deactivate_player() -> void:
	if player:
		player.is_active = false


func activate_player() -> void:
	player.is_active = true


func increase_wave_count() -> void:
	wave_count += 1


func reset_wave_count() -> void:
	wave_count = 0
