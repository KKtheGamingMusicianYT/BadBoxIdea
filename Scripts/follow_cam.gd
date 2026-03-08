extends Node2D
@export var camera : Camera2D

func _physics_process(_delta: float) -> void:
	position.x = camera.limit_right - 480
