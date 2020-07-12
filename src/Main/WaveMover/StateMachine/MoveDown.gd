extends State

export var move_distance: int = 10
export var move_time: float = 0.25

var waveMover: WaveMover

onready var downTween: Tween = $DownTween
onready var moveSound: AudioStreamPlayer = get_node("../../MoveSound")


func _on_DownTween_tween_all_completed() -> void:
	stateMachine.transition_to("MoveSideways")


func _ready() -> void:
	waveMover = get_node("../..")


# warning-ignore:unused_argument
func physics_process(delta: float) -> void:
	return


# warning-ignore:unused_argument
func enter(msg: Dictionary = {}) -> void:
	move_down()


func exit() -> void:
	return


func move_down() -> void:
	var target_position = waveMover.position.y + move_distance
	downTween.interpolate_method(
		waveMover,
		"set_position_y",
		waveMover.position.y,
		target_position,
		move_time,
		Tween.TRANS_LINEAR,
		Tween.EASE_OUT 
	)
	downTween.start()
	moveSound.play()


