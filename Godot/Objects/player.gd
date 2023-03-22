extends CharacterBody2D

var speed: int = 3
var size: int = 9

func _ready():
	$AnimationPlayer.play(str(size))

func _physics_process(_delta):
	$AnimationPlayer.play(str(size))
	
	
	
		
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1 * speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 * speed
	move_and_collide(velocity)

func enlargePlayer():
	if size < 16:
		size += 1
		
func minimizePlayer():
	if size > 0:
		size -= 1
