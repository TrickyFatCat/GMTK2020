extends Node

var shoot_pause: float = 3
var shoot_number: int = 10

onready var enemyContainer: Node2D = get_node("../EnemyContainer")
onready var pauseTimer: Timer = $PauseTimer


func _ready() -> void:
	pauseTimer.wait_time = shoot_pause


func start_shooting() -> void:
	pauseTimer.start()


func _on_PauseTimer_timeout() -> void:
	var enemies = enemyContainer.get_children()
	enemies.shuffle()
	
	if shoot_number > enemyContainer.get_child_count() - 1:
		shoot_number = enemyContainer.get_child_count() 
	
	for i in range(shoot_number):
		enemies[i].shoot()
