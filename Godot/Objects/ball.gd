extends CharacterBody2D

var speed: int = 75
var go: bool = false
var player

func _ready():
	randomize()
	velocity.x = [-.5,.5][randi() % 2]
	velocity.y = 1
	player = get_parent().get_node("Player")
	emit_signal("BallCreated")

func _physics_process(delta):
	if(go):
		var collision_object = move_and_collide(velocity * speed * delta)
		if collision_object:
			if collision_object.get_collider().name == "Player":
#				# so this make the ball go left if it lands on the left side of the bat or vice versa
				velocity = velocity.from_angle(Vector2(player.position.x, player.position.y).angle_to_point(Vector2(position.x, position.y)))
			else:
				# build in bounce for any thing else
				velocity = velocity.bounce(collision_object.get_normal())
				#need to kill ball if falls out
				#need to add brick logic
	else:
		position.x = player.position.x
		position.y = player.position.y - 8
		
	if Input.is_action_pressed("ui_accept"):
		go = true
