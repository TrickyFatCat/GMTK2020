extends Node2D
class_name WaveMover

onready var waveTween: Tween = $WaveTween
onready var stateMachine: StateMachine = $StateMachine


func _on_DeathZone_body_entered(body: Node) -> void:
	TransitionScreen.start_transition()


func _on_WaveTween_tween_all_completed() -> void:
	if stateMachine.is_current_state("Spawn"):
		stateMachine.transition_to("MoveSideways")


func _ready() -> void:
	GameManager.connect("game_started", self, "spawn")
	


func set_position_x(new_position: float) -> void:
	position.x = new_position


func set_position_y(new_position: float) -> void:
	position.y = new_position


func spawn() -> void:
	stateMachine.transition_to("Spawn")
