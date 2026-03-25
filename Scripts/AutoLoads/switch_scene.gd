extends Node

signal progress_changed(progress)
signal load_done

var _loading_screen_path : String = "res://Scenes/loading_screen.tscn"
var _load_screen = load(_loading_screen_path)

var _scene_path : String
var _loaded_resource : PackedScene

var _progress : Array = []

var use_sub_threads : bool = false

func switch_to(scene : String, wait_time: int) -> void:
	var timer = get_tree().create_timer(wait_time)
	await timer.timeout
	get_tree().change_scene_to_file.call_deferred(scene)
	#load_scene(scene, wait_time)
	
func load_scene(scene: String, wait_time: int) -> void:
	
	var timer = get_tree().create_timer(wait_time)
	await timer.timeout
	
	_scene_path = scene
	
	var new_loading_screen = _load_screen.instantiate()
	get_tree().get_root().add_child(new_loading_screen)
	
	self.progress_changed.connect(new_loading_screen._update_progress_bar)
	self.load_done.connect(new_loading_screen._start_outro_animation)
	
	await Signal(new_loading_screen, "loading_screen_has_full_coverage")
	start_load()

func start_load() -> void:
	var state = ResourceLoader.load_threaded_request(_scene_path, "", use_sub_threads)
	if state == OK:
		set_process(true)
		
func _process(_delta: float) -> void:
	var load_status = ResourceLoader.load_threaded_get_status(_scene_path, _progress)
	match load_status:
		0, 2: #? THREAD_LOAD_INVALID_RESOURCE, THREAD_LOAD_FAILED
			set_process(false)
			return
		1: #? THREAD_LOAD_IN_PROGRESS
			emit_signal("progress_changed", _progress[0])
		3: #? THREAD_LOAD_LOADED
			_loaded_resource = ResourceLoader.load_threaded_get(_scene_path)
			emit_signal("progress_changed", _progress[0])
			get_tree().change_scene_to_packed(_loaded_resource)
	
func reset() -> void:
	var timer = get_tree().create_timer(3.0)
	await timer.timeout
	get_tree().reload_current_scene.call_deferred()
