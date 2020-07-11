extends Node2D
class_name WaveMover

onready var waveTween: Tween = $WaveTween
onready var stateMachine: StateMachine = $StateMachine


func _ready() -> void:
	GameManager.connect("game_started", self, "spawn")


func set_spawn_position(new_position: float) -> void:
	position.y = new_position


func spawn() -> void:
	stateMachine.transition_to("Spawn")


func _on_WaveTween_tween_completed(object: Object, key: NodePath) -> void:
	print(object, " | ", key)
	if stateMachine.is_current_state("Spawn"):
		stateMachine.transition_to("Active")
	pass # Replace with function body.
