extends Area2D
class_name Goal

@export var level : PackedScene

func _on_body_entered(_body: Player) -> void:
	SwitchScene.switch_to(level.resource_path, 0)
