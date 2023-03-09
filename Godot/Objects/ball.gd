extends CharacterBody2D

var speed: int = 75
var go: bool = false
var player
var controller
const playerLayer: int = 1 
const wallLayer: int = 2 
const brickLayer: int = 4
const outOfBoundsLayer: int = 8

func _ready():
	randomize()
	velocity.x = [-.5,.5][randi() % 2]
	velocity.y = 1
	player = get_parent().get_node("Player")
	get_parent().ballCreated()

func _physics_process(delta):
	if(go):
		var collisionObj = move_and_collide(velocity * speed * delta)
		if collisionObj:
			var objHit = collisionObj.get_collider()
			
			match objHit.get_collision_layer():
				outOfBoundsLayer:
					#kill ball if falls out
					get_parent().ballKilled()
					queue_free()
				playerLayer:
	#				# so this make the ball go left if it lands on the left side of the bat or vice versa
					velocity = velocity.from_angle(Vector2(player.position.x, player.position.y).angle_to_point(Vector2(position.x, position.y)))
					speed += 10
				brickLayer:
					velocity = velocity.bounce(collisionObj.get_normal())
					objHit.queue_free() # delete brick
					get_parent().brickKilled()
				_:
					# build in bounce for any thing else
					velocity = velocity.bounce(collisionObj.get_normal())
	else:
		position.x = player.position.x
		position.y = player.position.y - 8
		
	if Input.is_action_pressed("ui_accept"):
		go = true
