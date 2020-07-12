extends Position2D 
class_name Weapon

export var rate_of_fire: float = 3

var can_shoot: bool = true
var is_shooting: bool = false
var projectile_scene


onready var shootTimer: Timer = $ShootTimer
onready var shootSound: AudioStreamPlayer = $ShootSound


func _on_ShootTimer_timeout() -> void:
	can_shoot = true


func _ready() -> void:
	shootTimer.wait_time = 1 / rate_of_fire


func process_shooting() -> void:
	var projectile = projectile_scene.instance() 
	LevelLoader.current_level.call_deferred("add_child", projectile)
	yield(get_tree(), "idle_frame")
	projectile.global_position = self.global_position
	can_shoot = false
	shootTimer.start()
	if not shootSound.playing:
		shootSound.play()


