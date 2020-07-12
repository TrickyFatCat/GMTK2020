extends Area2D
class_name HitPoints

signal on_hitpoints_decreased
signal on_hitpoints_increased
signal on_hitpoints_zero
signal on_invulnerability_started
signal on_invulnerability_fineshed

var is_invulnerable: bool = false

export var hitpoints_max: int = 3
export var can_be_invulnerable: bool = false
export var invulnerability_duration: float = 1.5

onready var hitpoints: int = hitpoints_max
onready var invulnerabilityTimer: Timer = $InvulnerabilityTimer


func _on_body_entered(body: PhysicsBody2D) -> void:
	if !is_invulnerable:
		decrease_hitpoints()
	
	body.queue_free()


func _on_area_entered(area: Area2D) -> void:
	if !is_invulnerable:
		decrease_hitpoints(hitpoints)


func _on_InvulnerabilityTimer_timeout() -> void:
	is_invulnerable = false
	print("Hello")
	emit_signal("on_invulnerability_fineshed")


func _ready() -> void:
	invulnerabilityTimer.wait_time = invulnerability_duration


func decrease_hitpoints(damage: int = 1) -> void:
	hitpoints -= damage
	hitpoints = max(hitpoints, 0)
	
	if hitpoints == 0:
		emit_signal("on_hitpoints_zero")
	else:
		if can_be_invulnerable and not is_invulnerable:
			is_invulnerable = true
			invulnerabilityTimer.start()
			emit_signal("on_invulnerability_started")
		
		emit_signal("on_hitpoints_decreased")


func increase_hitpoints(heal: int) -> void:
	hitpoints += heal
	emit_signal("on_hitpoints_increased")
