class_name CharacterBodyProperties
extends Resource
@export_group("Physics")
@export var GRAVITY : Dictionary[String, int] = {"Falling" = 75, "Jumping" = 50}
@export var GRAVITY_LIMIT : int = 980
@export var VELOCITY : Vector2 = Vector2(10,0)
@export var ACCELERATION : Vector2 = Vector2(0.4, 0)
@export var DECELERATION : Vector2 = Vector2(0.5, 0)
@export_subgroup("Jumping")
@export var INITIAL_JUMP_VELOCITY : int = -750
@export var JUMP_VELOCITY : int = -75
@export var INITIAL_JUMP_FRAMES : int = 10
@export var JUMPING_FRAMES : int = 20
@export_subgroup("Walking and Running")
@export var WALKING_SPEED : int = 200
@export var RUNNING_SPEED : int = 400
