extends State

const SPAWN_TIME: float = 0.75

export var target_position: float = 0

var waveMover: WaveMover

onready var spawnTween: Tween = $SpawnTween
onready var enemyContainer: Node2D = get_node("../../EnemyContainer")


func _on_SpawnTween_tween_all_completed() -> void:
	if stateMachine.is_current_state("Spawn"):
		stateMachine.transition_to("MoveSideways")


func _ready() -> void:
	waveMover = get_node("../..")


# warning-ignore:unused_argument
func physics_process(delta: float) -> void:
	return


# warning-ignore:unused_argument
func enter(msg: Dictionary = {}) -> void:
	spawnTween.interpolate_method(
		waveMover,
		"set_position_y",
		waveMover.position.y,
		target_position,
		SPAWN_TIME,
		Tween.TRANS_ELASTIC,
		Tween.EASE_OUT 
	)
	spawnTween.start()


func exit() -> void:
	for enemy in enemyContainer.get_children():
		enemy.stateMachine.transition_to("Active")
	
	get_node("../../EnemyShootController").start_shooting()
	return
