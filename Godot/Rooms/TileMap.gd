extends TileMap

var global

# Called when the node enters the scene tree for the first time.
func _ready():
	global = get_node("/root/Globals")
	set_cells_terrain_connect(0, global.tiles, 0, 0)

func getLevelStatus(x, y):
	return global.levelDic.get(str(x)+str(y))
