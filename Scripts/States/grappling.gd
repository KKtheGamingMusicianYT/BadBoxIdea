extends State
class_name Grappling

var parent : CharacterBody
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func enter() -> void:
	enter_ran = true
	
func exit() -> void:
	pass
	
func update() -> void:
	# What is ran during the current state
	pass

func recieve_state_machine(_reference: StateMachine) -> void:
	parent = _reference.parent
