extends Area2D

# Button Variables
var _upgrade_cost: int = 1
var _max_upgrade: int = 5
var _upgrade_amount:float = .5
var _press_available: bool = false
@onready var anim:AnimationPlayer = $AnimationPlayer


func _process(delta):
	_attack_up()
	
func _attack_up():
	var _current_upgrade_amount_count = ButtonGlobals.first_attack_power_upgrade_count
	
	if _current_upgrade_amount_count < _max_upgrade and _press_available and _upgrade_cost <= GameState.score:
		if Input.is_action_just_pressed("mouse_click"):
			GameState.player_attack_multiplier += _upgrade_amount
			ButtonGlobals.first_attack_power_upgrade_count += 1
			GameState.score -= _upgrade_cost
			anim.play("press")
	if _current_upgrade_amount_count == _max_upgrade:
		$Sprite2D.set_self_modulate("ffffff8d")
		ButtonGlobals.second_attack_power_upgrade_useable = true
		
func _on_mouse_entered():
	_press_available = true

func _on_mouse_exited():
	_press_available = false
