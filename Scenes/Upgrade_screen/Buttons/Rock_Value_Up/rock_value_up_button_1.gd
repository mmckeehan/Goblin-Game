extends Area2D

# Button Variables
var _upgrade_cost: int = 10
var _max_upgrade: int = 1
var _upgrade_amount: int = ButtonGlobals.first_rock_value_upgrade_amount
var _press_available: bool = false
@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready():
	pass

func _process(delta):
	_attack_up()
	
func _attack_up():
	var _current_upgrade_amount_count = ButtonGlobals.first_rock_value_upgrade_count
	var _upgrade: bool = _able_to_upgrade(_current_upgrade_amount_count)
	
	if Input.is_action_just_pressed("mouse_click") and _upgrade:
		GameState.rock_health *= 2
		GameState.rock_worth *= _upgrade_amount
		GameState.score -= _upgrade_cost
		anim.play("press")
		$Sprite2D.set_self_modulate("ffffff8d")
		ButtonGlobals.second_rock_value_upgrade_useable = true
		ButtonGlobals.first_rock_value_upgrade_count += 1
		
func _able_to_upgrade(_upgrade_count):
	var _cost_check: bool = false
	
	if (GameState.score - _upgrade_cost) >= 0:
		_cost_check = true
	if _upgrade_count < _max_upgrade and _press_available and _cost_check: 
		return true
	return false

func _on_mouse_entered():
	_press_available = true

func _on_mouse_exited():
	_press_available = false
