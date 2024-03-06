extends Node2D

const enemyPre = preload("res://scene/enemy_1.tscn")
var timer = 0

func _physics_process(delta):
	if (global.lives > 0):
		timer += delta
		if (timer > randf_range(1, 4)):
			timer = 0
			var enemy = enemyPre.instantiate()
			add_child(enemy)
			var random = randi_range(1, 4)

			match random:
				1:
					enemy.position = Vector2(randf_range(-10, 330), -10)
				2:
					enemy.position = Vector2(randf_range(-10, 330), 190)
				3: 
					enemy.position = Vector2(-10, randf_range(-10, 190))
				4:
					enemy.position = Vector2(330, randf_range(-10, 190))
