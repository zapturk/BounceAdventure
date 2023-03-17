extends CharacterBody2D

var speed: int = 75
var go: bool = false
var player
var controller
var room
@onready var rng = RandomNumberGenerator.new()


func _ready():
	velocity.x = rng.randf_range(-.5, .5)
	velocity.y = -1
	room = get_parent().get_parent()
	player = room.get_node("Player")

func _physics_process(delta):
	if(go):
		var collisionObj = move_and_collide(velocity * speed * delta)
		if collisionObj:
			var objHit = collisionObj.get_collider()
			
			match objHit.get_collision_layer():
				Globals.outOfBoundsLayer:
					#kill ball if falls out
					queue_free()
				Globals.playerLayer:
	#				# so this make the ball go left if it lands on the left side of the bat or vice versa
					velocity = velocity.from_angle(Vector2(player.position.x, player.position.y).angle_to_point(Vector2(position.x, position.y)))
					speed += 10
				Globals.brickLayer:
					velocity = velocity.bounce(collisionObj.get_normal())
					objHit.destroyBrick() # delete brick
				_:
					# build in bounce for any thing else
					velocity = velocity.bounce(collisionObj.get_normal())
	else:
		position.x = player.position.x
		position.y = player.position.y - 8
		
	if Input.is_action_pressed("ui_accept"):
		go = true
