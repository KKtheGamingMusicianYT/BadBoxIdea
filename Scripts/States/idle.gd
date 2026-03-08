extends State
class_name Idle

var parent : CharacterBody
# Called when the node the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func enter() -> void:
	enter_ran = true

func exit() -> void:
	pass
	
func update() -> void:
	if abs(parent.velocity.x) != 0:
		parent.velocity.x = move_toward(\
		parent.velocity.x, 0, abs(parent.velocity.x) * (1 - parent.properties.DECELERATION.x))
		# Caps-off velocity.x to desired speed, and has it trend back to desired 
		# speed after going faster
	if abs(parent.velocity.x) < 0.09:
		parent.velocity.x = 0
	
func recieve_state_machine(reference: StateMachine) -> void:
	parent = reference.parent
