extends Node

func switch_to(scene : StringName) -> void:
	get_tree().change_scene_to_file.call_deferred(scene)

func reset() -> void:
	get_tree().reload_current_scene.call_deferred()
