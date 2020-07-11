extends GameLevel

const START_TIMER_DURATION: float = 3.0


#func _init() -> void:


func _ready() -> void:
	GameManager.start_timer_duration = START_TIMER_DURATION
	GameManager.connect("game_started", Global.player, "start_spawn")
