extends StaticBody2D
class_name GroundTileset

@export var sprite : Sprite2D

func _ready() -> void:
	if get_parent() is not TileMapLayer:
		return
	var parent : TileMapLayer = get_parent()
	material = parent.material
	sprite.material = material
