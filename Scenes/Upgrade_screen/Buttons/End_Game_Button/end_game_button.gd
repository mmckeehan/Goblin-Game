extends Area2D

# Button Variables
var _max_upgrade: int = 1
var _upgrade_amount:float = 1
var _press_available: bool = false
var _upgrade_cost: int = 100

func _ready():
	$Sprite2D.set_self_modulate("ffffff00")

func _process(delta):
	if ButtonGlobals.end_game_useable:
		_attack_up()
	
func _attack_up():
	$Sprite2D.set_self_modulate("ffffff")

	if _press_available and _upgrade_cost <= GameState.score:
		if Input.is_action_just_pressed("mouse_click"):
			SceneManager.current_scene = SceneManager.SCENE.END_SCREEN

func _on_mouse_entered():
	_press_available = true

func _on_mouse_exited():
	_press_available = false
