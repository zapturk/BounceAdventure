extends Node2D

@onready var levelDic = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	setLevelDic()

func setLevelDic():
	for x in range(-200, 200):
		for y in range(-200, 200):
			levelDic.merge({str(x)+str(y): false})
	print("set level dic")

func getLevelStatus(x, y):
	return levelDic.get(str(x)+str(y))
