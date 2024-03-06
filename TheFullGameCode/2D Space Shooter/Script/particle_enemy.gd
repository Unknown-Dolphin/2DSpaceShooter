extends Sprite2D

var speed = randf_range(40, 60)
var timer = 0
var random1 = randf_range(0.2, 2.5)
var random2 = randf_range(0.2, 1)

var randomVector = Vector2(randf_range(-50, 50), randf_range(-50, 50))
@onready var earth = get_node('../Earth')

func _physics_process(delta):
	modulate.a -= random1 * delta
	modulate.r -= random2 * delta
	if (timer > 4):
		timer = 0
		self.queue_free()
	position += (position - position.move_toward(earth.position, 1)).normalized() * speed * delta
	position += randomVector * delta
	
