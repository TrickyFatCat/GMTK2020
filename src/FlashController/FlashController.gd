extends Node
class_name FlashController

const MIN_FLASH_ALPHA: float = 0.0
const MAX_FLASH_ALPHA: float = 1.0

export(float) var flash_duration: = 0.35
export(bool) var is_oneshot: = false

var is_active: bool = false setget set_is_active

onready var target_sprite: AnimatedSprite = get_parent()
onready var flash_shader: ShaderMaterial = target_sprite.material


func _ready() -> void:
	GlobalTween.connect("tween_completed", self, "restart_flash")


func set_is_active(value: bool) -> void:
	is_active = value
	
	if value:
		start_flash()
	else:
		pass

func set_flash_alpha(value: float) -> void:
	value = clamp(value, MIN_FLASH_ALPHA, MAX_FLASH_ALPHA)
	flash_shader.set_shader_param("u_alpha", value)


func start_flash() -> void:
# warning-ignore:return_value_discarded
	GlobalTween.interpolate_method(
		self,
		"set_flash_alpha",
		MAX_FLASH_ALPHA,
		MIN_FLASH_ALPHA,
		flash_duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
# warning-ignore:return_value_discarded
	GlobalTween.start()

func restart_flash(object: Object, key: NodePath) -> void:
	if object == self:
		if is_active and not is_oneshot:
			start_flash()
		elif is_active and is_oneshot:
			is_active = false
