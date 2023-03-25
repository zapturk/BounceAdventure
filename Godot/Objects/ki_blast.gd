extends Area2D

var direction: Vector2
var speed: int = 250


# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2.UP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	match body.get_collision_layer():
				Globals.brickLayer:
					body.destroyBrick()
				Globals.outOfBoundsLayer:
					queue_free()
				_:
					pass
