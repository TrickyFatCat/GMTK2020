extends State

export var move_count: int = 2
export var move_distance: int = 50
export var move_time: float = 1
export var move_pause: float = 1

var move_direction: int = -1
var waveMover: WaveMover

onready var sidewaysTween: Tween = $SidewaysTween
onready var move_counter: int = move_count / 2 
onready var pauseTimer: Timer = $PauseTimer


func _on_SidewaysTween_tween_all_completed() -> void:
	pauseTimer.start()


func _on_PauseTimer_timeout() -> void:
	if move_counter != move_count:
		move_sideways()
	else:
		stateMachine.transition_to("MoveDown")


func _ready() -> void:
	waveMover = get_node("../..")
	pauseTimer.wait_time = move_pause


# warning-ignore:unused_argument
func physics_process(delta: float) -> void:
	return 


# warning-ignore:unused_argument
func enter(msg: Dictionary = {}) -> void:
	move_sideways()


func exit() -> void:
	move_counter = 0
	move_direction *= -1


func move_sideways() -> void:
	var target_position = waveMover.position.x + move_distance * move_direction
	sidewaysTween.interpolate_method(
		waveMover,
		"set_position_x",
		waveMover.position.x,
		target_position,
		move_time,
		Tween.TRANS_QUINT,
		Tween.EASE_IN
	)
	sidewaysTween.start()
	move_counter += 1


