extends State

const TARGET_POSITION: float = 0.0
const SPAWN_DURATION: float = 0.75

onready var player: Player = Global.player
onready var spawnTween: Tween = $SpawnTween


func _on_SpawnTween_tween_all_completed() -> void:
	stateMachine.transition_to("Move/Idle")


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	spawnTween.interpolate_method(
		player,
		"set_sprite_position",
		player.SPRITE_INIT_POS,
		TARGET_POSITION,
		SPAWN_DURATION,
		Tween.TRANS_ELASTIC,
		Tween.EASE_OUT
	)
	spawnTween.start()


func exit() -> void:
	player.is_active = true


