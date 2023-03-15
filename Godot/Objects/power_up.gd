extends CharacterBody2D

const fallSpeed: int = 55 
const powerUpOptions = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var selectedPowerUp

func _ready():
	selectedPowerUp = powerUpOptions.pick_random()
	
	#for testing
	selectedPowerUp = "C"
	
	$AnimationPlayer.play(selectedPowerUp)
	velocity = Vector2.DOWN

func _physics_process(delta):
	var collisionObj = move_and_collide(velocity * fallSpeed * delta)
	if collisionObj:
			var objHit = collisionObj.get_collider()
			match objHit.get_collision_layer():
				Globals.outOfBoundsLayer:
					queue_free()
				Globals.playerLayer:
					match selectedPowerUp:
						"C":
							get_parent().cloneBalls()
						_:
							pass
					queue_free()
				_:
					pass
