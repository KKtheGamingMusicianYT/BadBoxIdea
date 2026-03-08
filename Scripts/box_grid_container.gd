extends GridContainer
class_name BoxInterfaceGridContainer
@export var volume_limit : int
@export var box : bool
var sum_of_children_vol : int = 0
var child_ids : Array
signal broadcast_self(parent: BoxInterfaceGridContainer)

func _ready() -> void:
	_connect_to_items()
	get_volume_of_children()
	get_id_of_children()
	
func get_volume_of_children() -> int:
	sum_of_children_vol = 0
	for child : Item in get_children():
		sum_of_children_vol += child.item.volume
	return sum_of_children_vol
	
func _connect_to_items() -> void:
	for child : Item in get_children():
		broadcast_self.connect(child.recieve_parent)
		broadcast_self.emit(self)

func get_id_of_children() -> Array:
	child_ids = []
	for child : Item in get_children():
		child_ids.append(child.id)
	return child_ids
