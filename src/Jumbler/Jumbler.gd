extends Node
class_name Jumbler

var jumble_pause: float = 15
var actions: Array = [
	"shoot",
	"move_left",
	"move_right"
]
var action_lists: Dictionary = {
	"shoot": [],
	"move_left": [],
	"move_right": []
}

onready var jumbleTimer: Timer = $JumbleTimer
onready var jumpbleSound: AudioStreamPlayer = $JumbleSound


func _on_JumbleTimer_timeout() -> void:
	jumble_controls()


func _init() -> void:
	Global.jumbler = self


func _ready() -> void:
	set_action_lists(0)
	set_action_lists(1)
	set_action_lists(2)
	reset_controls()
	jumbleTimer.wait_time = jumble_pause
	GameManager.connect("game_started", jumbleTimer, "start")


func set_action_lists(action_id: int) -> void:
	action_lists[actions[action_id]] = InputMap.get_action_list(actions[action_id])


func jumble_controls() -> void:
	randomize()
	actions.shuffle()
	add_events_to_action("shoot", 0)
	add_events_to_action("move_left", 1)
	add_events_to_action("move_right", 2)
	jumpbleSound.play()
	Events.emit_signal("controls_jumbled")
	


func add_events_to_action(action: String, event_id: int) -> void:
	InputMap.action_erase_events(action)
	
	for input_event in action_lists[actions[event_id]]:
		InputMap.action_add_event(action, input_event)


func reset_controls() -> void:
	for action in actions:
		reset_action_events(action)


func reset_action_events(action: String) -> void:
	InputMap.action_erase_events(action)
	
	for input_event in action_lists[action]:
		InputMap.action_add_event(action, input_event)
