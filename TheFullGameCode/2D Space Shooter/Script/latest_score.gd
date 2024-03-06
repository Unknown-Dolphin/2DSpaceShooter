extends Label

func _physics_process(delta):
	text = "your last score : " + str(global.score)
