extends Position2D

var player: Player = Global.player
var rate_of_fire: float = 3
var can_shoot: bool = true
var is_shooting: bool = false

onready var projectile_scene = preload("res://src/Player/Projectile/PlayerProjectile.tscn")
onready var shootTimer: Timer = $ShootTimer


func _on_ShootTimer_timeout() -> void:
	print("hey")
	can_shoot = true


func _ready() -> void:
	shootTimer.wait_time = 1 / rate_of_fire


func _unhandled_input(event: InputEvent) -> void:
	is_shooting = true if event.is_action_pressed("shoot") else false
	
	if player.stateMachine.is_current_state("Idle") or player.stateMachine.is_current_state("Fly"):
		if is_shooting and can_shoot:
			process_shooting()


func process_shooting() -> void:
	var projectile = projectile_scene.instance()
	print(projectile.name)
	get_tree().get_root().call_deferred("add_child", projectile)
	yield(get_tree(), "idle_frame")
	projectile.global_position = self.global_position
	can_shoot = false
	shootTimer.start()


