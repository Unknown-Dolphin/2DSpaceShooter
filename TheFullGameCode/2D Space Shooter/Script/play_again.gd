extends Label

var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (global.lives < 0):
		if (Input.is_action_just_pressed("ui_accept")):
			global.lives = 3
			global.score = 0
			get_tree().reload_current_scene()

		timer += delta
		if (timer > 1):
			modulate.a = 0
		if (timer > 2):
			timer = 0
			modulate.a = 255
