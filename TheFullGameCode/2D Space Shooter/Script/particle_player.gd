extends Sprite2D

var speed = randf_range(40, 60)
var timer = 0
var random1 = randf_range(0.2, 2.5)
var random2 = randf_range(0.01, 0.5)
var random3 = randf_range(0.6, 2)
var randomVector = Vector2(randf_range(-50, 50), randf_range(-50, 50))

@onready var player = get_node('../Player')
@onready var direction = player.velocity.normalized()

func _physics_process(delta):
	modulate.a -= random1 * delta
	modulate.r -= random2 * delta
	modulate.b -= random3 * delta
	if (timer > 4):
		timer = 0
		self.queue_free()
	if (global.lives > 0):
		position -= direction * speed * delta
	position += randomVector * delta
