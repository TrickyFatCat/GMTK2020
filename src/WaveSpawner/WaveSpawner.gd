extends Node2D
class_name WaveSpawner

const SPAWN_DURATION: float = 3.0

var waves_easy: PoolStringArray = [
	"res://src/Waves/EasyWaves/WeaveEasy00.tscn",
	"res://src/Waves/EasyWaves/WeaveEasy01.tscn",
	"res://src/Waves/EasyWaves/WeaveEasy02.tscn"
]
var waves_normal: PoolStringArray = [
	"res://src/Waves/NormalWaves/NormalWave00.tscn",
	"res://src/Waves/NormalWaves/NormalWave01.tscn",
	"res://src/Waves/NormalWaves/NormalWave02.tscn"
]
var waves_hard: PoolStringArray = [
	"res://src/Waves/HardWaves/HardWave00.tscn",
	"res://src/Waves/HardWaves/HardWave01.tscn",
	"res://src/Waves/HardWaves/HardWave02.tscn"
]
var waves: Array = [
	waves_easy,
	waves_normal,
	waves_hard
]
var active_wave

onready var spawnTimer: = $SpawnTimer


func _on_SpawnTimer_timeout() -> void:
	spawn_wave()


func _init() -> void:
	Global.waveSpawner = self


func _ready() -> void:
	Events.connect("wave_complete", spawnTimer, "start")
	GameManager.connect("game_started", self, "spawn_wave")
	spawnTimer.wait_time = SPAWN_DURATION


func spawn_wave() -> void:
	var wave_id = 0
	if Global.wave_count < 9:
		match Global.wave_count:
			0:
				wave_id = 0
			3:
				wave_id = 1
			6:
				wave_id = 2
	else:
		wave_id = randi() % waves.size()
	
	var current_wave = waves[wave_id]
	randomize()
	var wave_to_spawn = randi() % current_wave.size()
	var wave_scene:= load(current_wave[wave_to_spawn])
	var wave = wave_scene.instance()
	LevelLoader.current_level.call_deferred("add_child", wave)
	yield(get_tree(), "idle_frame")
	wave.position = self.position
	wave.call_deferred("spawn")
	Events.emit_signal("wave_spawned")


