extends Label


func _ready() -> void:
	var waves_number = Global.wave_count
	text = "Waves " + String(waves_number)
