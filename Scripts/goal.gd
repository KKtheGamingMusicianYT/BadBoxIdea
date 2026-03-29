extends Area2D
class_name Goal

@export var level : PackedScene

func _on_body_entered(_body: Player) -> void:
	_body.set_physics_process(false)
	SwitchScene.switch_to(level.resource_path, 0)
