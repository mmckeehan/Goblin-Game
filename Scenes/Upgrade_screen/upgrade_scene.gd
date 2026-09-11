extends Node

# Upgrade Variables
var attack_upgrade_amount: float = .05
var attack_upgrade_taken: int = 0
var attack_upgrade_cost: int = 1

# Preloaded scenes and nodes
@export var _currency_label: Label

# Scene paths
var Main_Game_Path: String = "res://Scenes/Main_Game/Main_Game.tscn"
var Title_Screen_Path: String = "res://Scenes/Title/Title_Screen.tscn"


func _process(delta):
	_currency_label.text = "Currency: %s" % str(GameState.score)

func _on_back_to_game_pressed():
	#TODO: This is loading a new instance of the file every time instead of saving the
	#current points. Will need to figure out how to save the points between
	#rounds.
	#--- Done(ish), I have the points variable stored on the Game_State.gd
	#script. There is a scene management script that will maintain going between 
	#scenes.
	get_tree().change_scene_to_file(Main_Game_Path)
	

func _on_back_to_title_pressed():
	get_tree().change_scene_to_file(Title_Screen_Path)
