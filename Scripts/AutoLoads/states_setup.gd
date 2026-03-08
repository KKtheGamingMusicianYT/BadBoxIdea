extends Node

var possible_states : Dictionary = {} # Dictionary holding paths to the State nodes dynamically

var state_machine : StateMachine

func get_states() -> void:
	var loops : int = -1
	var nested_loops : int = -1
	# Gets the children of the StateMachine node to populate the possible_states dict 
	# It looks like this: {0: State1, 1: State2}
	for child : Node in state_machine.get_children():
		loops += 1
		if child.get_child_count() == 0: # Checks if the current child is a state or a container
			possible_states.get_or_add(loops, child.name) # No children = state
		else: # Children = get the container's state paths
			for nested_child : Node in child.get_children():
				nested_loops += 1
				possible_states.get_or_add(nested_loops + loops, StringName(child.name + "/" + nested_child.name))
			loops += nested_loops # To be sure all nested states are accounted for
			nested_loops = -1

func setup_states(parent_state_machine: StateMachine) -> Dictionary:
	possible_states = {}
	state_machine = parent_state_machine
	# StateMachine path is given to the state
	get_states()
	return possible_states
	
