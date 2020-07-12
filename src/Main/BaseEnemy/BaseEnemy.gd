extends Node2D
class_name Enemy

onready var stateMachine: StateMachine = $StateMachine


func set_active(value: bool) -> void:
	stateMachine.transition_to("Active")


func _on_EnemyHitpoints_on_hitpoints_zero() -> void:
	stateMachine.transition_to("Death")


func _on_AnimatedSprite_animation_finished() -> void:
	destroy_enemy()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if stateMachine.is_current_state("Active"):
		destroy_enemy()


func destroy_enemy() -> void:
	Events.emit_signal("enemy_dead")
	queue_free()
