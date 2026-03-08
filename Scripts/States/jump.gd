extends State
class_name Jump

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
	if parent.jumping > parent.properties.JUMPING_FRAMES - parent.properties.INITIAL_JUMP_FRAMES:
		parent.velocity.y = parent.properties.INITIAL_JUMP_VELOCITY
	else:
		parent.velocity.y = parent.properties.JUMP_VELOCITY
	
	parent.velocity.x += parent.properties.ACCELERATION.x * parent.properties.VELOCITY.x * parent.direction
	
	parent.jumping -= 1
	
	if abs(parent.velocity.x) >= parent.properties.VELOCITY.x:
		parent.velocity.x = move_toward(\
		parent.velocity.x, \
		parent.properties.VELOCITY.x * parent.direction, \
		abs(parent.velocity.x) * (1 - parent.properties.DECELERATION.x))
func recieve_state_machine(reference: StateMachine) -> void:
	parent = reference.parent
