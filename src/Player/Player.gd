extends KinematicBody2D
class_name Player

var is_active: bool = true setget set_is_active

onready var stateMachine: StateMachine = $StateMachine
onready var collider: CollisionShape2D = $CollisionShape2D


func _init() -> void:
	Global.player = self


func set_is_active(value: bool) -> void:
	is_active = value
	
	if !collider:
		return

	$DamageDetector/CollisionShape2D.disabled = !value
	stateMachine.set_process_unhandled_input(value)
