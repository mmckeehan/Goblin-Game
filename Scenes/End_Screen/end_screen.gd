extends Node2D


func _on_exit_button_pressed():
	SceneManager.current_scene = SceneManager.SCENE.GAME_QUIT

func _on_restart_button_pressed():
	SceneManager.current_scene = SceneManager.SCENE.TITLE_SCREEN
