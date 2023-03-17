extends Node2D

@onready var levelDic = {}
@onready var tiles = []
@onready var playerX = 0
@onready var playerY = 0
@onready var ballLimit = 10

const playerLayer: int = 1 
const wallLayer: int = 2 
const brickLayer: int = 4
const outOfBoundsLayer: int = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	setLevelDic()
	setTiles()

func setLevelDic():
	for x in range(-200, 200):
		for y in range(-200, 200):
			levelDic.merge({str(x)+str(y): false})

func setTiles():
	tiles = []
	for x in range(playerX - 8, playerX + 15):
		for y in range(playerY - 7, playerY + 6):
			if !levelDic.get(str(x)+str(y)):
				tiles.insert(tiles.size(), Vector2i(x, y))
