extends State
class_name Run
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
	if abs(parent.velocity.x) >= parent.properties.RUNNING_SPEED:
		parent.velocity.x = move_toward(\
		parent.velocity.x, \
		parent.properties.RUNNING_SPEED * parent.direction, \
		abs(parent.velocity.x) * (1 - parent.properties.DECELERATION.x))
		# Caps-off velocity.x to desired speed, and has it trend back to desired 
		# speed after going faster
	else: 
		parent.velocity.x += parent.properties.ACCELERATION.x * parent.properties.WALKING_SPEED * parent.direction

func recieve_state_machine(reference: StateMachine) -> void:
	parent = reference.parent
