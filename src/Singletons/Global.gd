extends Node

const FLOOR_NORMAL: Vector2 = Vector2.ZERO

var player: Player
var waveSpawner: WaveSpawner
var jumbler: Jumbler
var wave_count: int = 0
var points: int = 0
var points_per_enemy: int = 100


func _ready() -> void:
	Events.connect("enemy_dead", self, "increase_points")
	reset_points()


func deactivate_player() -> void:
	if player:
		player.is_active = false


func activate_player() -> void:
	player.is_active = true


func increase_wave_count() -> void:
	wave_count += 1


func reset_wave_count() -> void:
	wave_count = 0


func increase_points() -> void:
	var wave_factor = 1 if wave_count == 0 else wave_count
	points += points_per_enemy * wave_factor
	Events.emit_signal("points_increased")


func reset_points() -> void:
	points = 0
