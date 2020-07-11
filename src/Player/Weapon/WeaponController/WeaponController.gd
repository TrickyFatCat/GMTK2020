extends Node2D

var is_shooting: bool = false

onready var projectile: = preload("res://src/Player/Weapon/PlayerProjectile.tscn")
onready var playerWeapon: Weapon = $PlayerWeapon
onready var player = Global.player


func _ready() -> void:
	playerWeapon.projectile_scene = projectile


func _unhandled_input(event: InputEvent) -> void:
	is_shooting = true if event.is_action_pressed("shoot") else false
	
	if player.stateMachine.is_current_state("Idle") or player.stateMachine.is_current_state("Fly"):
		if is_shooting and playerWeapon.can_shoot:
			playerWeapon.process_shooting()
