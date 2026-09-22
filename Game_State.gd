extends Node
# This is a script that manages the Game State for the current iteration. 
# This includes upgradable variabels.

# Player Variables
var player_attack_speed: float = 3
var player_attack_multiplier: float = 1
var player_attack_power: float = .75 * player_attack_multiplier
var player_movement_speed: float = 100

# Rock Variables
var rock_health: float = 1
var rock_worth: int  = 1

# Main Game Variables
var rock_spawn_time: float = 8
var game_time: float = 10
var score: int = 500


func add_score():
	score += rock_worth

func reset_game_state():
	# This function resets the game state to its default values.
	player_attack_speed = 3
	player_attack_multiplier = 1
	player_movement_speed = 100
	rock_health = 1
	rock_worth = 1
	rock_spawn_time = 8
	game_time = 10
	score = 0
