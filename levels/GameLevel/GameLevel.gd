extends GameLevel

const START_TIMER_DURATION: float = 3.0


func _ready() -> void:
	GameManager.start_timer_duration = START_TIMER_DURATION
	TransitionScreen.connect("screen_opened", Global.player, "start_spawn")
	Global.reset_wave_count()


func _on_GameOverZone_area_entered(area: Area2D) -> void:
	Global.player.destroy_player()
