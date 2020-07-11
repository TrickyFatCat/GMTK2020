extends State

const SPAWN_TIME: float = 0.75

export var target_position: float = 0

var waveMover: Node2D
var waveTween: Tween


func _ready() -> void:
	waveMover = get_node("../..")
	waveTween = get_node("../../WaveTween")


# warning-ignore:unused_argument
func physics_process(delta: float) -> void:
	return


# warning-ignore:unused_argument
func enter(msg: Dictionary = {}) -> void:
	waveTween.interpolate_method(
		waveMover,
		"set_spawn_position",
		waveMover.position.y,
		target_position,
		SPAWN_TIME,
		Tween.TRANS_ELASTIC,
		Tween.EASE_OUT 
	)
	waveTween.start()


func exit() -> void:
	return
