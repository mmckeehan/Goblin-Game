extends Node

var Main_Game_Path: String = "res://Scenes/Main_Game/Main_Game.tscn"

func _ready():
	pass
	#print(GameState.player_movement_speed)

func _on_start_pressed():
	print("TITLE: Start Button Pressed")
	get_tree().change_scene_to_file(Main_Game_Path)

func _on_exit_pressed():
	print("TITLE: Exit Pressed")
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
