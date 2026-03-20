extends Area2D
class_name DeathBox

func _on_body_entered(_body: Player) -> void:
	SwitchScene.reset()
