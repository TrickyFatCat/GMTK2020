extends KinematicBody2D
class_name Projectile

export var velocity_max: Vector2 = Vector2(0, 300)
export var move_direction = Vector2.ZERO

var velocity: Vector2 = Vector2.ZERO
var is_active: bool = false


func _physics_process(delta: float) -> void:
	velocity = move_and_slide(move_direction * velocity_max, Global.FLOOR_NORMAL)


func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()


func destroy() -> void:
	queue_free()
