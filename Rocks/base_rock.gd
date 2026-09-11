
extends StaticBody2D

# STATES
enum STATE{
	DEFAULT,
	BREAK,
	DESTROY
}

# Signals
signal base_rock_destroyed(bool)

# Health Variables
var health: float = GameState.rock_health
var current_health: float

# STATE and Animation Variables
@onready var active_state = STATE.DEFAULT
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	current_health = health
	_new_position()
	
	################### BEGIN DEBUG STATEMENTS ####################
	# print("Starting Health: ", current_health)
	#################### END DEBUG STATEMENTS ##################### 
	

func _process(delta):
	if anim.frame == 7:
		_switch_state(STATE.DESTROY)
		
	################### BEGIN DEBUG STATEMENTS ####################
	# print(global_position)
	#################### END DEBUG STATEMENTS ##################### 
	

func _switch_state(to_state: STATE) -> void:
	# This function is used to switch the state of the object.
	active_state = to_state
	match active_state:
		STATE.DEFAULT:
			anim.play("Default")
		STATE.BREAK:
			anim.play("Break")
		STATE.DESTROY:
			queue_free()

func take_damage (damage):
	current_health -= damage
	if current_health <= 0:
		$".".set_collision_layer_value(3, false)
		$".".set_collision_mask_value(1, false)
		_switch_state(STATE.BREAK)
		base_rock_destroyed.emit()

func _new_position():
	var spawn_square_p1: Vector2 = Vector2 (16,16)
	var spawn_square_p2: Vector2 = Vector2 (214.35,113.5)
	var spawn_x: float = randf_range(spawn_square_p1.x, spawn_square_p2.x)
	var spawn_y: float = randf_range(spawn_square_p1.y, spawn_square_p2.y)
	var new_spawn: Vector2 = Vector2 (spawn_x, spawn_y)
	
	position = new_spawn


func _on_base_rock_destroyed():
	return true
