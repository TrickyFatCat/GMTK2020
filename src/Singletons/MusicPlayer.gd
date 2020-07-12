extends AudioStreamPlayer


var music: Array = [
	"res://sounds/bgm_track_00.wav",
	"res://sounds/bgm_track_01.wav",
	"res://sounds/bgm_track_02.wav"
]


func _ready() -> void:
	GameManager.connect("game_started", self, "play_random_track")


func play_random_track() -> void:
	var track_id = randi() % music.size()
	var track = load(music[track_id])
	stream = track
	play()


func _on_finished() -> void:
	play_random_track()
