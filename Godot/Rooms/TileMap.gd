extends TileMap

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	set_cells_terrain_connect(0, Globals.tiles, 0, 0)
