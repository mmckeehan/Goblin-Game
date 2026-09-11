extends Area2D

# Button Variables
var _max_upgrade: int = 1
var _upgrade_amount:float = 1
var _press_available: bool = false
@onready var anim:AnimationPlayer = $AnimationPlayer

func _ready():
	pass

func _process(delta):
	_attack_up()
	
func _attack_up():
	var _current_upgrade_amount_count = ButtonGlobals.first_rock_value_upgrade_count
	if _current_upgrade_amount_count < _max_upgrade and _press_available and _upgrade_cost <= GameState.score:
		if Input.is_action_just_pressed("mouse_click"):
			GameState.rock_health *= 2
			GameState.rock_worth *= 2
			ButtonGlobals.first_rock_value_upgrade_count += 1
			GameState.score -= 1
			anim.play("press")
	if _current_upgrade_amount_count == _max_upgrade:
		$Sprite2D.set_self_modulate("ffffff8d")

func _on_mouse_entered():
	_press_available = true

func _on_mouse_exited():
	_press_available = false
