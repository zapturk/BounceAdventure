extends CharacterBody2D

var speed: int = 3

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1 * speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 * speed
	move_and_collide(velocity)
