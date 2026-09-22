extends Node

# Enum that holds a collection of the different scenes in the game. This is used to switch between scenes.
enum SCENE{
	TITLE_SCREEN,
	MAIN_GAME,
	UPGRADE,
	END_SCREEN,
	GAME_QUIT
}

var current_scene: SCENE
var previous_scene: SCENE = -1

# Preload scenes
@onready var title_screen: PackedScene = preload("res://Scenes/Title/Title_Screen.tscn")
@onready var main_game: PackedScene = preload("res://Scenes/Main_Game/Main_Game.tscn")
@onready var upgrade_screen: PackedScene = preload("res://Scenes/Upgrade_screen/Upgrade_Scene.tscn")
@onready var end_screen: PackedScene = preload("res://Scenes/End_Screen/End_Screen.tscn")

	
func _process(delta):
	if current_scene != previous_scene:
		_switch_scene()
		previous_scene = current_scene

func _switch_scene():
	match current_scene:
		SCENE.TITLE_SCREEN:
			get_tree().change_scene_to_packed(title_screen)
			GameState.reset_game_state() # Reset the game state when returning to the title screen
			ButtonGlobals.reset_upgrades() # Reset the upgrade counts when returning to the title screen
			print("SCENE MANAGER: Switched scene to Title")
		SCENE.MAIN_GAME:
			get_tree().change_scene_to_packed(main_game)
			print("SCENE MANAGER: Switched scene to Main Game")
		SCENE.UPGRADE:
			get_tree().change_scene_to_packed(upgrade_screen)
			print("SCENE MANAGER: Switched scene to Upgrade")
		SCENE.END_SCREEN:
			get_tree().change_scene_to_packed(end_screen)
			print("SCENE MANAGER: Switched scene to Winner")
		SCENE.GAME_QUIT:
			get_tree().quit()
