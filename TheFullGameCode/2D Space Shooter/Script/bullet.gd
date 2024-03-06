extends CharacterBody2D

const speed = 180
var timer = 0

@onready var player = get_node('../Player')
@onready var direction = Vector2(sin(player.rotation), -cos(player.rotation))

func _physics_process(delta):
	timer += delta
	if (timer > 3):
		self.queue_free()
	
	velocity = direction * speed
	move_and_slide()
