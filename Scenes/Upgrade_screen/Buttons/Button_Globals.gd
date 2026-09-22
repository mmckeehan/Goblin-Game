extends Node

# Variables to manage the attack upgrade count
var first_attack_power_upgrade_count: int = 0
var first_attack_speed_upgrade_count: int = 0
var first_rock_respawn_upgrade_count: int = 0
var first_game_time_upgrade_count: int = 0
var first_rock_value_upgrade_count: int = 0

var second_attack_power_upgrade_count: int = 0
var second_attack_speed_upgrade_count: int = 0
var second_rock_respawn_upgrade_count: int = 0
var second_game_time_upgrade_count: int = 0
var second_rock_value_upgrade_count: int = 0
var second_attack_power_upgrade_useable: bool = false
var second_attack_speed_upgrade_useable: bool = false
var second_rock_respawn_upgrade_useable: bool = false
var second_game_time_upgrade_useable: bool = false
var second_rock_value_upgrade_useable: bool = false

var third_attack_power_upgrade_count: int = 0
var third_attack_speed_upgrade_count: int = 0
var third_rock_respawn_upgrade_count: int = 0
var third_game_time_upgrade_count: int = 0
var third_rock_value_upgrade_count: int = 0
var third_attack_power_upgrade_useable: bool = false
var third_attack_speed_upgrade_useable: bool = false
var third_rock_respawn_upgrade_useable: bool = false
var third_game_time_upgrade_useable: bool = false
var third_rock_value_upgrade_useable: bool = false

var end_game_useable: bool = false
var end_game_button_pressed: bool = false


func _process(delta):
    if third_attack_power_upgrade_count == 5 and third_attack_speed_upgrade_count == 5 and third_rock_respawn_upgrade_count == 5 and third_game_time_upgrade_count == 5 and third_rock_value_upgrade_count == 1:
        end_game_useable = true
    if end_game_button_pressed:
        print("Chicken Dinner")