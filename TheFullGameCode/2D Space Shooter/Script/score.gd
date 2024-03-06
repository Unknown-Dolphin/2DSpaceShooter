extends Label

func _physics_process(delta):
	text = "Score : " + str(global.score)
	if (global.lives < 1):
		modulate.a = 0
