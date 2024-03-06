extends Node2D

const particle_pre = preload("res://scene/particle_player.tscn")
var timer = 0
@onready var player = get_node('../Player')
@onready var earth = get_node('../Earth')

func death():
	player.modulate.a = 0
	earth.modulate.a = 0
	for i in 3:
		var particle = particle_pre.instantiate()
		get_parent().add_child(particle)
		#particle.modulate = Color(randf_range(0.8, 1), randf_range(0.8, 1), randf_range(0.8, 1))
		particle.position = player.position
	for i in 3:
		var particle = particle_pre.instantiate()
		get_parent().add_child(particle)
		#particle.modulate = Color(randf_range(0.8, 1), randf_range(0.8, 1), randf_range(0.8, 1))
		particle.position = earth.position

func _physics_process(delta):
	if (global.lives < 1):
		timer += delta
	if (timer > 2):
		global.lives = -1
	if (global.lives < 0):
		get_node('../play_again').modulate.a = 255
		get_node('../latest_score').modulate.a = 255
	match global.lives:
		3:
			$Life1.set_frame(8)
			$Life2.set_frame(8)
			$Life3.set_frame(8)
		2:
			$Life1.set_frame(8)
			$Life2.set_frame(8)
			$Life3.set_frame(9)
		1:
			$Life1.set_frame(8)
			$Life2.set_frame(9)
			$Life3.set_frame(9)
		0:
			$Life1.set_frame(9)
			$Life2.set_frame(9)
			$Life3.set_frame(9)
			death()
