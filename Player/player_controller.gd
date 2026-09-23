extends CharacterBody2D
#This is the controller for the player character.		
		
enum STATE{
	# Defines the different states of the character.
	DEFAULT,
	ATTACK
}


@onready var anim: AnimatedSprite2D = $Anims
@onready var attack_timer: Timer = $Attack_Speed_Timer
@export var pickaxe_collision: CollisionShape2D
@onready var pickaxe_sound_hit: AudioStreamPlayer = $Pickaxe_Hit

# State and Movement Variables
var _active_state: STATE = STATE.DEFAULT
var _speed: float = GameState.player_movement_speed

# Attack variables
var _attack_speed: float = GameState.player_attack_speed
var attack_power: float

func _ready():
	# This set variables for the player when they spawn in.
	pickaxe_collision.set_disabled(1)
	
func _physics_process(delta):
	#This is the main loop function for the player
	var direction_input = Input.get_vector("left","right","up","down")
	var attack_input = Input.is_action_just_pressed("attack")

	attack_power = GameState.player_attack_power

	match _active_state:
		STATE.DEFAULT:
			_movement(direction_input)
			_movement_animation()
			if attack_input and attack_timer.is_stopped():
				_switch_state(STATE.ATTACK)
		STATE.ATTACK:
			if anim.is_playing() == false:
				_switch_state(STATE.DEFAULT)
				print("PLAYER: Attack Power: ", attack_power)

	move_and_slide()
	
	################### BEGIN DEBUG STATEMENTS ####################
	# print ("Pickaxe Collider: ", pickaxe_collision.disabled)
	# print("TIME LEFT: ", attack_timer.time_left)
	# print("STATE: ", active_state)
	#################### END DEBUG STATEMENTS ##################### 
	
func _switch_state(to_state: STATE) -> void:
	# This function is used to switch the state of the object.
	_active_state = to_state
	match _active_state:
		STATE.DEFAULT:
			attack_timer.wait_time = _attack_speed
			attack_timer.start() # Starts the attack timer
			pickaxe_collision.set_disabled(1) # Disabled the pickaxe hitbox
		STATE.ATTACK:
			velocity = Vector2.ZERO # Sets player velocity to ZERO
			pickaxe_collision.set_disabled(0) # Enables the pickaxe hitbox
			anim.play("Attack") # Attack Anim
		
func _movement(direction):
	# This function is used to manage the movement of the character
	if direction:
		velocity = _speed * direction
	else:
		velocity = Vector2.ZERO
		
func _movement_animation():
	# This function is used to manage the animation of the character while moving
	if velocity == Vector2.ZERO:
		anim.play("Idle")
	else:
		if velocity.x > 0:
			anim.flip_h = false
			pickaxe_collision.position.x = 7.5
		elif velocity.x < 0:
			anim.flip_h = true
			pickaxe_collision.position.x = -7.5
		anim.play("Run")
	
func _on_pickaxe_hitbox_body_entered(body):
	# This function is used to detect when another body enters the hitbox.
	if body.has_method("take_damage"):
		body.take_damage(attack_power)
		pickaxe_sound_hit.play()
