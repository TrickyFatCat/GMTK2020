extends KinematicBody2D
class_name Player

const SPRITE_INIT_POS: float = 200.0

var is_active: bool = true setget set_is_active

onready var stateMachine: StateMachine = $StateMachine
onready var collider: CollisionShape2D = $CollisionShape2D
onready var sprite: Sprite = $Sprite


func _init() -> void:
	Global.player = self


func _ready() -> void:
	set_sprite_position(SPRITE_INIT_POS)


func set_is_active(value: bool) -> void:
	is_active = value
	
	if !collider:
		return
	
	stateMachine.set_process_unhandled_input(value)
	sprite.visible = value


func start_spawn() -> void:
	stateMachine.transition_to("Spawn")
	sprite.visible = true


func set_sprite_position(new_position: float) -> void:
	sprite.position.y = new_position
