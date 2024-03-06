extends Area2D

var speed = randf_range(10, 50)
@onready var earth = get_node('../Earth')
@onready var random = randf_range(-6, 6)

const particle_e = preload("res://scene/particle_enemy.tscn")

func _physics_process(delta):
	rotate(random * delta)
	position = position.move_toward(earth.position, speed * delta)

func particle_maker():
	var particle = particle_e.instantiate()
	get_parent().add_child(particle)
	particle.position = position

func _on_body_entered(body):
	if (body.is_in_group("bullet")):
		global.score += 1
		particle_maker()
		particle_maker()
		particle_maker()
		self.queue_free()
		
	if (body.is_in_group("player")):
		global.score += 1
		for i in 3:
			particle_maker()
		self.queue_free()
		
	if (body.is_in_group("earth")):
		for i in 3:
			particle_maker()
		global.lives -= 1
		self.queue_free()
		
	pass # Replace with function body.

