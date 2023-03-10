extends CharacterBody2D

const fallSpeed: int = 55 

func _ready():
	$AnimationPlayer.play("A")
	velocity = Vector2.DOWN

func _physics_process(delta):
	var collisionObj = move_and_collide(velocity * fallSpeed * delta)
	if collisionObj:
			var objHit = collisionObj.get_collider()
			match objHit.get_collision_layer():
				Globals.outOfBoundsLayer:
					queue_free()
				Globals.playerLayer:
					#Do amazing power up here
					queue_free()
				_:
					pass
