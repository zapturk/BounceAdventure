extends CharacterBody2D

var speed: int = 150 
var yPos: int

func _ready():
	yPos = global_position.y

func _physics_process(delta):
	position.y = yPos
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1 * speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 * speed
	move_and_slide()
