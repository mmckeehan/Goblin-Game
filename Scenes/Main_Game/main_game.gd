extends Node

# Scenes and paths
var Base_Rock_Scene = preload("res://Rocks/Base_Rock.tscn")

# Timers
@export var rock_respawn_timer: Timer
@export var game_timer: Timer
var rock_spawn_time: float = GameState.rock_spawn_time
var game_time: float = GameState.game_time

# UI Elements and Variables
@export var score_display: Label
@export var game_time_display: Label
@export var player_position: Label

# Other Exports
@export var rock_parent_node: Node
@export var player: CharacterBody2D

func _ready():
	game_timer.set_wait_time(game_time)
	game_timer.start()
	_spawn_base_rock()
	# Catches any rocks placed by hand in the editor (must be in "rocks" group)
	for rock in get_tree().get_nodes_in_group("rocks"):
		if not rock.base_rock_destroyed.is_connected(_on_base_rock_destroyed):
			rock.base_rock_destroyed.connect(_on_base_rock_destroyed)
			
func _process(delta):
	var _score = GameState.score
	_spawn_base_rock()
	score_display.text = "Currency: %s" % str(_score)
	game_time_display.text = str(game_timer.time_left).left(4)
	player_position.text = str(GameState.player_attack_power)
	
func _spawn_base_rock():
	var new_rock = Base_Rock_Scene.instantiate()
	new_rock.base_rock_destroyed.connect(_on_base_rock_destroyed)
	if rock_respawn_timer.time_left == 0:
		rock_parent_node.add_child(new_rock)
		rock_respawn_timer.wait_time = rock_spawn_time
		rock_respawn_timer.start()

func _end_round():
	rock_respawn_timer.set_paused(true)
	_remove_objects_at_round_end()
	SceneManager.current_scene = SceneManager.SCENE.UPGRADE
	
func _remove_objects_at_round_end():
	var all_rock_nodes: Array = rock_parent_node.get_children()
	for rock_node in all_rock_nodes:
		rock_node.queue_free()

func _on_base_rock_destroyed():
	GameState.add_score()

func _on_game_timer_timeout():
	_end_round()
