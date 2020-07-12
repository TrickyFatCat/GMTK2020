extends Node

export var shoot_pause: float = 3
export var shoot_number: int = 1

var change_factor_max: float = 0.75

onready var enemyContainer: Node2D = get_node("../EnemyContainer")
onready var pauseTimer: Timer = $PauseTimer
onready var change_factor: float = change_factor_max / get_node("../EnemyContainer").get_child_count()

func _ready() -> void:
	pauseTimer.wait_time = shoot_pause
	Events.connect("enemy_dead", self, "calculate_parameters")


func start_shooting() -> void:
	pauseTimer.start()


func _on_PauseTimer_timeout() -> void:
	var enemies = enemyContainer.get_children()
	enemies.shuffle()
	
	if shoot_number > enemyContainer.get_child_count() - 1:
		shoot_number = enemyContainer.get_child_count() 
	
	for i in range(shoot_number):
		enemies[i].shoot()


func calculate_parameters() -> void:
	pauseTimer.wait_time -= shoot_pause * change_factor
