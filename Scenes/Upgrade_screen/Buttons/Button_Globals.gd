extends Node

# Variables to manage the attack upgrade count
var first_attack_power_upgrade_count: int = 0
var second_attack_power_upgrade_count: int = 0
var third_attack_power_upgrade_count: int = 0
var first_attack_power_upgrade_amount: float = 0.25
var second_attack_power_upgrade_amount: float = .75
var third_attack_power_upgrade_amount: float = 1.25
var second_attack_power_upgrade_useable: bool = false
var third_attack_power_upgrade_useable: bool = false

# Variables to manage the attack speed upgrade count
var first_attack_speed_upgrade_count: int = 0
var second_attack_speed_upgrade_count: int = 0
var third_attack_speed_upgrade_count: int = 0
var first_attack_speed_upgrade_amount: float = .5
var second_attack_speed_upgrade_amount: float = .75
var third_attack_speed_upgrade_amount: float = 1
var second_attack_speed_upgrade_useable: bool = false
var third_attack_speed_upgrade_useable: bool = false

# Variables to manage the rock respawn upgrade count
var first_rock_respawn_upgrade_count: int = 0
var second_rock_respawn_upgrade_count: int = 0
var third_rock_respawn_upgrade_count: int = 0
var first_rock_respawn_upgrade_amount: float = .75
var second_rock_respawn_upgrade_amount: float = 1
var third_rock_respawn_upgrade_amount: float = 1.25
var second_rock_respawn_upgrade_useable: bool = false
var third_rock_respawn_upgrade_useable: bool = false

# Variables to manage the Game Time upgrade count
var first_game_time_upgrade_count: int = 0
var second_game_time_upgrade_count: int = 0
var third_game_time_upgrade_count: int = 0
var first_game_time_upgrade_amount: float = 1
var second_game_time_upgrade_amount: float = 1.5
var third_game_time_upgrade_amount: float = 2
var second_game_time_upgrade_useable: bool = false
var third_game_time_upgrade_useable: bool = false

# Variables to manage the rock value upgrade count
var first_rock_value_upgrade_count: int = 0
var second_rock_value_upgrade_count: int = 0
var third_rock_value_upgrade_count: int = 0
var first_rock_value_upgrade_amount: int = 2
var second_rock_value_upgrade_amount: int = 2
var third_rock_value_upgrade_amount: int = 2
var second_rock_value_upgrade_useable: bool = false
var third_rock_value_upgrade_useable: bool = false

# Variables to manage the end game button
var end_game_useable: bool = false
var end_game_button_pressed: bool = false


func _process(delta):
	# Process is just to ensure that the end game button is useable.
	if third_attack_power_upgrade_count == 5 and third_attack_speed_upgrade_count == 5 and third_rock_respawn_upgrade_count == 5 and third_game_time_upgrade_count == 5 and third_rock_value_upgrade_count == 1:
		end_game_useable = true
	if end_game_button_pressed:
		print("Chicken Dinner")

func reset_upgrades():
	# Resets all the variables for a new game. 
	first_attack_power_upgrade_count = 0
	first_attack_speed_upgrade_count = 0
	first_rock_respawn_upgrade_count = 0
	first_game_time_upgrade_count = 0
	first_rock_value_upgrade_count = 0

	second_attack_power_upgrade_count = 0
	second_attack_speed_upgrade_count = 0
	second_rock_respawn_upgrade_count = 0
	second_game_time_upgrade_count = 0
	second_rock_value_upgrade_count = 0
	second_attack_power_upgrade_useable = false
	second_attack_speed_upgrade_useable = false
	second_rock_respawn_upgrade_useable = false
	second_game_time_upgrade_useable = false
	second_rock_value_upgrade_useable = false

	third_attack_power_upgrade_count = 0
	third_attack_speed_upgrade_count = 0
	third_rock_respawn_upgrade_count = 0
	third_game_time_upgrade_count = 0
	third_rock_value_upgrade_count = 0
	third_attack_power_upgrade_useable = false
	third_attack_speed_upgrade_useable = false
	third_rock_respawn_upgrade_useable = false
	third_game_time_upgrade_useable = false
	third_rock_value_upgrade_useable = false

	end_game_useable = false
	end_game_button_pressed = false
