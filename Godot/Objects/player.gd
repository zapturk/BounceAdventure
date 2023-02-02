extends CharacterBody2D

const SPEED = 300.0
var moving = false
var tile_size = 19

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + direction * tile_size, 1.0/4.0).set_trans(Tween.TRANS_SINE)
