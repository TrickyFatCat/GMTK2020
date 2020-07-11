extends Node2D
class_name WaveSpawner

var waves_easy: PoolStringArray = []
var active_waves


func _ready() -> void:
	Events.connect("wave_complete", self, "spawn_wave")
	GameManager.connect("game_started", self, "spawn_wave")


func spawn_wave() -> void:
	var wave_scene:= load("res://src/Main/WaveMover/WaveMover.tscn")
	var wave = wave_scene.instance()
	LevelLoader.current_level.call_deferred("add_child", wave)
	yield(get_tree(), "idle_frame")
	wave.position = self.position
	wave.call_deferred("spawn")
	pass
