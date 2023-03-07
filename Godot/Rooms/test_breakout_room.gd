extends Node2D

var ballCount: int = 0
var brickCount: int = 0
var ball = preload("res://Objects/ball.tscn")
signal level_changed
@onready var global = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	createBall()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if ballCount == 0:
		createBall()
	if brickCount == 0:
		global.levelDic["00"] = true
		print(global.levelDic.get(str(0)+str(0)))
		#global.tiles.erase(Vector2i(0, 0))
		emit_signal("level_changed", "overworld")
	
func createBall():
	add_child(ball.instantiate())

func ballCreated():
	ballCount += 1
	
func ballKilled():
	ballCount -= 1

func brickCreated():
	brickCount += 1
	
func brickKilled():
	brickCount -= 1
