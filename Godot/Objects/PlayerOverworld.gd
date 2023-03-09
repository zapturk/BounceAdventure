extends Area2D

var TileSize = 16
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}
var moving = false
@onready var coordinates = $"Label"
signal level_changed


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(Globals.playerX * TileSize + 8, Globals.playerY * TileSize + 8)
	position = position.snapped(Vector2.ONE * TileSize/2)
	coordinates.set_text(coordinatsText())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$MoveButton.visible = !moving
	$MoveButton2.visible = !moving
	$MoveButton3.visible = !moving
	$MoveButton4.visible = !moving

func _unhandled_input(event):
	if moving:
		return
		
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + inputs[dir] * TileSize, 1.0/3).set_trans(Tween.TRANS_SINE)
	moving = true
	await tween.finished
	moving = false
	Globals.playerX = getX()
	Globals.playerY = getY()
	Globals.setTiles()
	coordinates.set_text(coordinatsText())
	
func coordinatsText():
	var text = ""
	var x = getX()
	var y = getY()
	
	text = "x:" + str(x) + " y:" + str(y)
		
	return text
	
func getX():
	return (global_position.x - 8) / 16
	
func getY():
	return (global_position.y - 8) / 16

func getPlayerPosLevelStatus():
	return Globals.getLevelStatus(getX(), getY())

func getMoveVisable(x, y):
	return getLevelStatus(x, y) || getLevelStatus(x-1, y) || getLevelStatus(x+1, y) || getLevelStatus(x, y-1) || getLevelStatus(x, y+1)

func _on_play_button_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
				emit_signal("level_changed", "play")

func getLevelStatus(x, y):
	return Globals.levelDic.get(str(x)+str(y))
