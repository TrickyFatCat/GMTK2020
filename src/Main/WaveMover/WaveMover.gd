extends Node2D
class_name WaveMover

onready var stateMachine: StateMachine = $StateMachine
onready var enemyContainer: Node2D = $EnemyContainer

func _on_DeathZone_body_entered(body: Node) -> void:
	Global.player.destroy_player()


func _ready() -> void:
	Events.connect("enemy_dead", self, "check_container")


func set_position_x(new_position: float) -> void:
	position.x = new_position


func set_position_y(new_position: float) -> void:
	position.y = new_position


func spawn() -> void:
	stateMachine.transition_to("Spawn")


func check_container() -> void:
	if enemyContainer.get_child_count() - 1 == 0:
		Events.emit_signal("wave_complete")
		Global.increase_wave_count()
		queue_free()
