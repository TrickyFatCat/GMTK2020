extends State

onready var player: Player = Global.player
onready var move: State = get_parent()


func unhandled_input(event: InputEvent) -> void:
	move.unhandled_input(event)


func physics_process(delta: float) -> void:
	if move.get_move_direction().x == 0.0:
		stateMachine.transition_to("Move/Idle")
	
	move.physics_process(delta)


func enter(msg: Dictionary = {}) -> void:
	move.enter()


func exit() -> void:
	move.exit()
