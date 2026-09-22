extends Node

@onready var _two: Label = $"2"
@onready var _three: Label = $"3"
@onready var _one_hundred: Label = $"100"

func _ready():
	_two.set_self_modulate("ffffff00")
	_three.set_self_modulate("ffffff00")
	_one_hundred.set_self_modulate("ffffff00")

func _process(delta):
	if ButtonGlobals.second_attack_power_upgrade_useable or ButtonGlobals.second_attack_speed_upgrade_useable or ButtonGlobals.second_rock_respawn_upgrade_useable or ButtonGlobals.second_game_time_upgrade_useable or ButtonGlobals.second_rock_value_upgrade_useable:
		_two.set_self_modulate("ffffff")
	if ButtonGlobals.third_attack_power_upgrade_useable or ButtonGlobals.third_attack_speed_upgrade_useable or ButtonGlobals.third_rock_respawn_upgrade_useable or ButtonGlobals.third_game_time_upgrade_useable or ButtonGlobals.third_rock_value_upgrade_useable:
		_three.set_self_modulate("ffffff")
	if ButtonGlobals.end_game_useable:
		_one_hundred.set_self_modulate("ffffff")
