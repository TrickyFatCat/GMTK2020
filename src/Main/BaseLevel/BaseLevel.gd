extends Node
class_name GameLevel

export(String, FILE, "*.tscn") var next_level: = ""


func _get_configuration_warning() -> String:
	var warning: String = "Next level must be chosen."
	return warning if !next_level else ""


func _ready() -> void:
	if !Engine.editor_hint:
		Events.emit_signal("level_loaded")
		
		if next_level:
			LevelLoader.next_level = next_level
		
		LevelLoader.current_level = self
