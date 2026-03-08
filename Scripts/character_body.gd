extends CharacterBody2D
class_name CharacterBody

signal states_aquired # Signals to the state_machine that possible_states is populated and is good for use

@export var properties : CharacterBodyProperties
@export var state_machine: StateMachine
@export var direction : float = 1

var possible_states : Dictionary = {} # Dictionary holding paths to the State nodes dynamically
var current_state : StringName # Reference for the current_state for easier typing

var falling : int = 0
var jumping : int = 0

func _ready() -> void:
	states_aquired.emit()

func setup_states() -> void:
	possible_states = StatesSetup.setup_states(state_machine)
	states_aquired.emit()

func change_state(new_state : int) -> void:
	state_machine.change_state(current_state, possible_states[new_state])
	
func _update_box_dir() -> void:
	pass

func _match_states() -> void:
	pass
