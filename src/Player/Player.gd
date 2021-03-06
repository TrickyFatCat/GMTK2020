extends KinematicBody2D
class_name Player

const SPRITE_INIT_POS: float = 200.0

var is_active: bool = true setget set_is_active

onready var stateMachine: StateMachine = $StateMachine
onready var collider: CollisionShape2D = $CollisionShape2D
onready var sprite: AnimatedSprite = $Sprite
onready var hitPoints: HitPoints = $PlayerHitpoints
onready var damageSound: AudioStreamPlayer = $DamageSound
onready var flashController: FlashController = $Sprite/FlashController


func _on_PlayerHitpoints_on_hitpoints_decreased() -> void:
	Events.emit_signal("player_took_damage")
	flashController.is_active = true
	damageSound.play()


func _on_PlayerHitpoints_on_hitpoints_zero() -> void:
	stateMachine.transition_to("Death")


func _on_Sprite_animation_finished() -> void:
	if stateMachine.is_current_state("Death"):
		stateMachine.transition_to("Inactive")


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if position.x < -10:
		position.x = 650
	elif position.x > 0:
		position.x = 0


func _on_PlayerHitpoints_on_invulnerability_fineshed() -> void:
	flashController.is_active = false


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


func destroy_player() -> void:
	$PlayerHitpoints.decrease_hitpoints($PlayerHitpoints.hitpoints)


