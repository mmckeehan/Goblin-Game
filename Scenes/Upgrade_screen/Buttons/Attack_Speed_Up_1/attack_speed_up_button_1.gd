extends Area2D

# Button Variables
var _upgrade_cost: int = 1
var _max_upgrade: int = 5
var _upgrade_amount:float = .2
var _press_available: bool = false
@onready var anim:AnimationPlayer = $AnimationPlayer


func _process(delta):
	_speed_up()

	
func _speed_up():
	var _current_upgrade_amount_count = ButtonGlobals.first_attack_speed_upgrade_count
	
	if _current_upgrade_amount_count < _max_upgrade and _press_available:
		if Input.is_action_just_pressed("mouse_click"):
			GameState.player_attack_speed -= _upgrade_amount
			ButtonGlobals.first_attack_speed_upgrade_count += 1
			GameState.score -= _upgrade_cost
			anim.play("press")
	if _current_upgrade_amount_count == _max_upgrade:
		$Sprite2D.set_self_modulate("ffffff8d")
		ButtonGlobals.second_attack_speed_upgrade_useable = true
		
func _on_mouse_entered():
	_press_available = true
	#print("ATTACK_UP_BITTON: Entered")

func _on_mouse_exited():
	_press_available = false
	#print("ATTACK_UP_BITTON: Exited")
