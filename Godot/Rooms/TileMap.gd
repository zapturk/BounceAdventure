extends TileMap

var global
var tiles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	global = get_node("/root/Globals")
	for x in range(-200, 200):
		for y in range(-200, 200):
			if global.getLevelStatus(x, y):
				tiles.insert(tiles.size(), Vector2i(x, y))
	set_cells_terrain_connect(0, tiles, 0, 0)
