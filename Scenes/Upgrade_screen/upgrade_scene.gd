extends Node

# Upgrade Variables
var attack_upgrade_amount: float = .05
var attack_upgrade_taken: int = 0
var attack_upgrade_cost: int = 1

# Preloaded scenes and nodes
@export var _currency_label: Label


func _process(delta):
	_currency_label.text = "Currency: %s" % str(GameState.score)

func _on_back_to_game_pressed():
	SceneManager.current_scene = SceneManager.SCENE.MAIN_GAME
	

func _on_back_to_title_pressed():
	SceneManager.current_scene = SceneManager.SCENE.TITLE_SCREEN
