extends State

onready var player: Player = Global.player
onready var spawnTween: Tween = $SpawnTween


func _on_SpawnTween_tween_all_completed() -> void:
	stateMachine.transition_to("Move/Idle")


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	spawnTween.interpolate_method(player, "set_spawn_scale", 0, 0.35, 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	spawnTween.start()
	pass


func exit() -> void:
	player.is_active = true


