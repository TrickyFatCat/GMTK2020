extends KinematicBody2D

var velocity_max: Vector2 = Vector2(0, 300)
var velocity: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity = move_and_slide(-velocity_max, Global.FLOOR_NORMAL)


func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()
