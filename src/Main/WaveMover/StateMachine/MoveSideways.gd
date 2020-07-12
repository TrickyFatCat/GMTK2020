extends State

export var move_count: int = 2
export var move_distance: int = 50
export var move_time: float = 0.5
export var move_pause: float = 0.75

var move_direction: int = -1
var waveMover: WaveMover
var change_factor_max: float = 0.5

onready var sidewaysTween: Tween = $SidewaysTween
onready var move_counter: int = move_count / 2 
onready var pauseTimer: Timer = $PauseTimer
onready var change_factor: float = change_factor_max / get_node("../../EnemyContainer").get_child_count()
onready var move_time_default: float = move_time
onready var moveSound: AudioStreamPlayer = get_node("../../MoveSound")


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
	Events.connect("enemy_dead", self, "calculate_parameters")


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
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	sidewaysTween.start()
	move_counter += 1
	moveSound.play()


func calculate_parameters() -> void:
	pauseTimer.wait_time -= move_pause * change_factor
	move_time -= move_time_default * change_factor
