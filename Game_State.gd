extends Node
# This is a script that manages the Game State for the current iteration. 
# This includes upgradable variabels.

# Connected Scenes


# Player Variables
var player_attack_speed: float = 3
var player_attack_multiplier: float = 1
var player_movement_speed: float = 100

# Rock Variables
var rock_health: float = 1
var rock_worth: int  = 1

# Main Game Variables
var rock_spawn_time: float = 8
var game_time: float = 10
var score: int = 500


func add_score():
	print("GAME_STATE: Print Score Added")
	score += rock_worth
