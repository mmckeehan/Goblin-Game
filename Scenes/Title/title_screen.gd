extends Node

func _on_start_pressed():
	SceneManager.current_scene = SceneManager.SCENE.MAIN_GAME

func _on_exit_pressed():
	SceneManager.current_scene = SceneManager.GAME_QUIT



func _on_debug_end_pressed():
	SceneManager.current_scene = SceneManager.SCENE.END_SCREEN


func _on_debug_upgrade_pressed():
	GameState.score = 500
	SceneManager.current_scene = SceneManager.SCENE.UPGRADE
