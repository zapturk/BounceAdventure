extends Area2D

var TileSize = 16
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}
var moving = false
var coordinates
var levelDic = {}
signal level_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * TileSize)
	position += Vector2.ONE * TileSize/2
	coordinates = $"Label"
	coordinates.set_text(coordinatsText())
	setLevelDic()
	
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
	
func setLevelDic():
	for x in range(-200, 200):
		for y in range(-200, 200):
			levelDic.merge({str(x)+str(y): false})
	print(levelDic.get("00"))
	levelDic.merge({"00": true}, true)
	print(levelDic.get("00"))

func getPlayerPosLevelStatus():
	return getLevelStatus(getX(), getY())

func getLevelStatus(x, y):
	return levelDic.get(str(x)+str(y))

func getMoveVisable(x, y):
	return getLevelStatus(x, y) || getLevelStatus(x-1, y) || getLevelStatus(x+1, y) || getLevelStatus(x, y-1) || getLevelStatus(x, y+1)


func _on_play_button_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("level_changed", "play")
