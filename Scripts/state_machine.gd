extends Node
class_name StateMachine

signal state_machine_path(node_path : Node) # Holds path to self for the parent and the states

var current_state : StringName
@export var parent : Node

func _ready() -> void:
	state_machine_path.emit(self)
	# Connects the signals that make sure the possible_states dict is populated
	parent.states_aquired.connect(_on_states_seen_be_parent)

func _physics_process(_delta: float) -> void:
	if get_node(str(current_state)).enter_ran == false:
		return
	get_node(str(current_state)).update()

# change_state(active_state, new_state) description
# Gets the path of the current state and the new state.
func change_state(active_state: StringName, new_state: StringName) -> void:
	if active_state == new_state or current_state == new_state:
		return
	await get_node(str(active_state)).exit()
	current_state = new_state
	get_node(str(current_state)).enter()
	# get_node gets the node by their StringName, so the state machine uses that to call the state's functions

func _on_states_seen_be_parent() -> void: # Reciever of parent.states_aquired
	# Sets the default state after the node paths are seen and stored by the CharacterBody2D
	current_state = parent.possible_states[parent.IDLE]
	get_node(str(current_state)).enter()
