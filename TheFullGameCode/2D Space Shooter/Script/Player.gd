extends CharacterBody2D

const bulletPre = preload("res://scene/bullet.tscn")
const particle_player_pre = preload('res://scene/particle_player.tscn')
const maxspeed = 100
const accel = 150
const friction = 75
const rotation_speed = 0.05

var input = Vector2(0, 0)
var timer = 0

func movement(delta):
	input.x = int(Input.is_action_pressed("ui_right"))
	input.x = input.x - int(Input.is_action_pressed("ui_left"))
	
	input.y = int(Input.is_action_pressed("ui_down"))
	input.y = input.y - int(Input.is_action_pressed("ui_up"))
	
	input = input.normalized()
	if (input.length() == 0):
		if (velocity.length() > 0.1):
			velocity = velocity - (velocity.normalized() * friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		shoot_particle()
		velocity = velocity + (input * accel * delta)
		velocity = velocity.limit_length(maxspeed)

func player_rotate(delta):
	var angle = -transform.y.angle_to(input)
	print(transform.y)
	rotate(sign(angle) * rotation_speed * delta * velocity.length())

func teleport():
	if(position.y < -5):
		position.y = 185
	if(position.y > 185):
		position.y = -5
	
	if(position.x < -5):
		position.x = 325
	if(position.x > 325):
		position.x = -5

func shoot_bullet():
	var bullet = bulletPre.instantiate()
	get_parent().add_child(bullet)
	bullet.position = position
	bullet.position = bullet.position + (Vector2(sin(rotation), -cos(rotation)) * 12)
	
	velocity -= Vector2(sin(rotation), -cos(rotation)) * 10

func shoot_particle():
	var particle = particle_player_pre.instantiate()
	get_parent().add_child(particle)
	particle.position = position
	particle.position -= Vector2(sin(rotation), -cos(rotation)) * 5

func _physics_process(delta):
	if (global.lives > 0):
		timer += delta
		if (Input.is_action_pressed("ui_accept") && timer > 0.3):
			timer = 0
			shoot_bullet()
		
		elif (Input.is_action_just_pressed("ui_accept")):
			timer = 0
			shoot_bullet()
		
		teleport()
		player_rotate(delta)
		movement(delta)
		move_and_slide()
