extends CanvasLayer

onready var hitpointsNumber: Label = $HBoxContainer/HitpointsCounter/HitpointsNumber
onready var startCounter: VBoxContainer = $StartCounter
onready var startTimer: Label = $StartCounter/Counter
onready var jumbleTimer: Label = $HBoxContainer/JumbleCounter/JumbleTimer
onready var jumbleMessage: Label = $JumbleMessage
onready var pointsNumber: Label = $HBoxContainer/Points/PointsNumber
onready var countdownSound: AudioStreamPlayer = $CountdownSound


func _ready() -> void:
	Events.connect("player_took_damage", self, "update_hitpoints")
	Events.connect("player_dead", self, "update_hitpoints")
	Events.connect("wave_complete", self, "show_start_counter")
	Events.connect("wave_spawned", self, "hide_start_counter")
	Events.connect("controls_jumbled", self, "show_jumble_message")
	GameManager.connect("count_started", self, "show_start_counter")
	GameManager.connect("game_started", self, "hide_start_counter")
	Events.connect("points_increased", self, "update_points")
	update_hitpoints()
	update_points()


func _process(delta: float) -> void:
	if GameManager.stateMachine.is_current_state("Starting"):
		if GameManager.startTimer.wait_time > 0:
			startTimer.text = String(round(GameManager.startTimer.time_left))
	else:
		if Global.waveSpawner.spawnTimer.wait_time > 0:
			startTimer.text = String(round(Global.waveSpawner.spawnTimer.time_left))
	
	jumbleTimer.text = String("%02d" % round(Global.jumbler.jumbleTimer.time_left))


func update_hitpoints() -> void:
	hitpointsNumber.text = String("%02d" % Global.player.hitPoints.hitpoints)


func show_start_counter() -> void:
	startCounter.visible = true
	countdownSound.play()


func hide_start_counter() -> void:
	startCounter.visible = false
	countdownSound.stop()


func show_jumble_message() -> void:
	jumbleMessage.visible = true
	yield(get_tree().create_timer(1),"timeout")
	jumbleMessage.visible = false


func update_points() -> void:
	pointsNumber.text = String("%07d" % Global.points)
