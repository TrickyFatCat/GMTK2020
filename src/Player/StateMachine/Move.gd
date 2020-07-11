extends State

export var velocity_max: Vector2 = Vector2.ZERO
export var acceleration: Vector2 = Vector2.ZERO
export var friction: float = 100

var velocity: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO

onready var player: Player = Global.player


func physics_process(delta: float) -> void:
	var direction = get_move_direction()
	calculate_velocity_x(delta, direction)
	velocity = player.move_and_slide(velocity, Global.FLOOR_NORMAL)


func get_move_direction() -> Vector2:
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	return direction if stateMachine.is_processing_unhandled_input() else Vector2.ZERO


func calculate_velocity_x(delta: float, direction: Vector2) -> void:
	if direction.x != 0 and abs(velocity.x) <= velocity_max.x:
		velocity.x += acceleration.x * direction.x * delta
		velocity.x = clamp(velocity.x, -velocity_max.x, velocity_max.x)
	elif velocity.x != 0 or abs(velocity.x) > velocity_max.x:
		direction.x = -sign(velocity.x)
		velocity.x += friction * direction.x * delta
		
		if direction.x < 0:
			velocity.x = max(velocity.x, 0)
		elif direction.x > 0:
			velocity.x = min(velocity.x, 0)
