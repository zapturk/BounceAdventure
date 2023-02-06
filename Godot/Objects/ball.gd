extends CharacterBody2D

var speed: int = 75

func _ready():
	randomize()
	velocity.x = [-.5,.5][randi() % 2]
	velocity.y = 1

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal())

func stop_ball():
	speed = 0

func restart_ball():
	speed = 50
	velocity.x = [-.5,.5][randi() % 2]
	velocity.y = 1
