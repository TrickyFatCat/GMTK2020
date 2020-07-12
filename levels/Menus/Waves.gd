extends HBoxContainer

onready var points_number: Label = $Points/Label
onready var waves_number: Label = $Waves/Label


func _ready() -> void:
	waves_number.text = String("%02d" % Global.wave_count)
	points_number.text = String("%07d" % Global.points)
