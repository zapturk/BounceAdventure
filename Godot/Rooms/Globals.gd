extends Node2D

@onready var levelDic = {}
@onready var tiles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	setLevelDic()

func setLevelDic():
	for x in range(-200, 200):
		for y in range(-200, 200):
			levelDic.merge({str(x)+str(y): false})
			#tiles.insert(tiles.size(), Vector2i(x, y))
