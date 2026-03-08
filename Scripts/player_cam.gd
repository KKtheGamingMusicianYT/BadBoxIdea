extends Camera2D
class_name PlayerCamera

@export var PLAYER : Player
@export var SHIFT : int = 300
@export var SMOOTHING : int = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void: ## Maybe clean this up a bit. it works very good tho.
	var player_velocity_x_dir : int =  PLAYER.velocity.x/abs(PLAYER.velocity.x)
	if abs(PLAYER.velocity.x) > 10 and PLAYER.direction:
		if global_position.x > get_viewport().size.x/4: # Smooth the camera if you are no longer hitting the left limit.
			position.x = move_toward(position.x, player_velocity_x_dir * SHIFT, abs(player_velocity_x_dir * SHIFT - position.x)/SMOOTHING)
		else: # You are hitting the left limit, then immediatly apply the shift with no smoothing
			position.x = move_toward(position.x, player_velocity_x_dir * SHIFT, abs(player_velocity_x_dir * SHIFT - position.x))
