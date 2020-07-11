extends Node2D
class_name WaveSpawner

const SPAWN_DURATION: float = 3.0

var waves_easy: PoolStringArray = []
var active_waves

onready var spawnTimer: = $SpawnTimer


func _on_SpawnTimer_timeout() -> void:
	spawn_wave()


func _ready() -> void:
	Events.connect("wave_complete", spawnTimer, "start")
	GameManager.connect("game_started", self, "spawn_wave")
	spawnTimer.wait_time = SPAWN_DURATION


func spawn_wave() -> void:
	var wave_scene:= load("res://src/Main/WaveMover/WaveMover.tscn")
	var wave = wave_scene.instance()
	LevelLoader.current_level.call_deferred("add_child", wave)
	yield(get_tree(), "idle_frame")
	wave.position = self.position
	wave.call_deferred("spawn")


