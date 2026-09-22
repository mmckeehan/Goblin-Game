extends Area2D

# Button Variables
var _upgrade_cost: int = 2
var _max_upgrade: int = 5
var _upgrade_amount:float = ButtonGlobals.second_attack_power_upgrade_amount
var _press_available: bool = false
@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready():
	$Sprite2D.set_self_modulate("ffffff00")

func _process(delta):
	if ButtonGlobals.second_attack_power_upgrade_useable:
		_attack_up()
	
func _attack_up():
	var _is_transparent: bool = false
	var _current_upgrade_amount_count = ButtonGlobals.second_attack_power_upgrade_count
	var _upgrade: bool = _able_to_upgrade(_current_upgrade_amount_count)

	if !_is_transparent:
		$Sprite2D.set_self_modulate("ffffff")
		if Input.is_action_just_pressed("mouse_click") and _upgrade:
			GameState.rock_spawn_time -= _upgrade_amount
			ButtonGlobals.second_attack_power_upgrade_count += 1
			GameState.score -= _upgrade_cost
			anim.play("press")
		if _current_upgrade_amount_count == _max_upgrade:
			_is_transparent = true
			ButtonGlobals.third_attack_power_upgrade_useable = true
			ButtonGlobals.second_attack_power_upgrade_useable = false
	if _is_transparent:
		$Sprite2D.set_self_modulate("ffffff8d")

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
