extends CharacterBody2D

@export var player_index = 0;

@export var GRAVITY = 20
@export var FRICTION = .55
@export var SPEED = 200
@export var JUMP_FORCE = -700
@export var JUMP_RELEASE_FORCE = .55
@export var FALL_GRAVITY = .5

@export var hp = 100
var healing = true
var can_jump = true
signal dead
signal shoot
func _ready():
	$HPbar.max_value = hp
	set_hpbar()
	if player_index == 0:
		$GF.hide()
		$GR.show()
	if player_index == 1:
		$GR.hide()
		$GF.show()
func _physics_process(delta):
	
	apply_friction()
	apply_gravity()
	print(healing)
	if hp >= 100:
		hp = 100
		
	#if Input.is_joy_button_pressed(player_index, 2) and healing:
		#hp += 1
		#set_hpbar()
	#if Input.is_action_just_released("heal") and player_index == 0:
		#healing = false
		#$heal_cooldown.start()
	#if Input.is_action_just_released("heal") and player_index == 1:
		#healing = false
		#$heal_cooldown.start()
		
		
		#if player_index == 1:
			#print("ack")
			#GRAVITY = 0
			#FRICTION = 0
			#SPEED = 0
			#JUMP_FORCE = 0
			#JUMP_RELEASE_FORCE = 0
			#FALL_GRAVITY = 0
		
	if hp <= 0:
		emit_signal("dead")
		#$Timer.start()
		queue_free()
	if Input.is_joy_button_pressed(player_index, 0) and can_jump:#or Input.is_action_pressed("jump") and can_jump:
		velocity.y = 20
		can_jump = false
		apply_jump_force()
	if Input.is_joy_button_pressed(player_index, 13):# or Input.is_action_pressed("left"):
		$Pshooter.rotation_degrees = 180
		##velocity.x += -10SharedArrayBuffer support — (Experimental) This may break parts of the page or your project. Only enable if you know you need it. Learn more
		apply_speed(-1)
	if Input.is_joy_button_pressed(player_index, 14):# or Input.is_action_pressed("right"):
		$Pshooter.rotation_degrees = 0
		apply_speed(1)
	if Input.is_joy_button_pressed(player_index, 11):# or Input.is_action_pressed("up"):
		$Pshooter.rotation_degrees = -90
	if Input.is_joy_button_pressed(player_index, 12):# or Input.is_action_pressed("down"):
		$Pshooter.rotation_degrees = 90
	if Input.is_joy_button_pressed(player_index, 10):# or Input.is_action_pressed("shoot"):
		#print("ghghghghghghghghghghghghg")
		emit_signal("shoot")
		#velocity.x += 10
		#apply_speed(1)
		pass
	move_and_slide()
	if Input.is_action_just_released("jump"):
		apply_fallg()
		jump_release_force()
		#print("gfdskjfgdskjg")
	if is_on_floor():
		can_jump = true
	if !is_on_floor():
		#$Timer.start()
		apply_fallg()
		pass



func apply_speed(poop):
	velocity.x += SPEED * poop
	
func apply_gravity():
	velocity.y += GRAVITY
	
func apply_friction():
	velocity.x *= FRICTION
	
func apply_jump_force():
	velocity.y += JUMP_FORCE
func apply_fallg():
	velocity.y += FALL_GRAVITY
func jump_release_force():
	velocity.y *= JUMP_RELEASE_FORCE
func set_hpbar():
	$HPbar.value = hp
	pass
func _on_timer_timeout():
	get_tree().reload_current_scene()
	#can_jump = false
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body is shooty:
		hp -= 1
		set_hpbar()
	pass # Replace with function body.


func _on_heal_cooldown_timeout():
	healing = true
	pass # Replace with function body.
