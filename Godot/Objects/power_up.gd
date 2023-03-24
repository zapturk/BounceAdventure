extends Area2D

const fallSpeed: int = 55 
const powerUpOptions = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var selectedPowerUp
var velocity
@onready var room = get_parent()

func _ready():
	selectedPowerUp = powerUpOptions.pick_random()
	
	#for testing
	selectedPowerUp = "M"
	
	$AnimationPlayer.play(selectedPowerUp)
	velocity = Vector2.DOWN
	

func _physics_process(delta):
	position += velocity * fallSpeed * delta

func _on_body_entered(body):
	match body.get_collision_layer():
				Globals.outOfBoundsLayer:
					queue_free()
				Globals.playerLayer:
					match selectedPowerUp:
						"C":
							room.cloneBalls()
						"E":
							room.enlargePlayer()
						"N":
							room.createBall()
						"M":
							room.minimizePlayer()
						_:
							pass
					queue_free()
				_:
					pass
