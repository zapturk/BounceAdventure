extends Area2D

var TileSize = 16
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * TileSize)
	position += Vector2.ONE * TileSize/2

func getDir(mousePos):
	var vec = "ui_right"
	var mouseSnap = get_global_mouse_position().snapped(Vector2.ONE * (TileSize*2))
	print(mouseSnap)
	
#	if get_global_mouse_position().x > position.x:
#		vec = "ui_right"
#	elif get_global_mouse_position().x < position.x:
#		vec = "ui_left"
	
	return vec

func _unhandled_input(event):
	if moving:
		return
		
	# Mouse in viewport coordinates.
#	if event is InputEventMouseButton:
#		move(getDir(event.position))
		
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	#position += inputs[dir] * TileSize
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + inputs[dir] * TileSize, 1.0/3).set_trans(Tween.TRANS_SINE)
	moving = true
	await tween.finished
	moving = false
