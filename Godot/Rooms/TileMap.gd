extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = [Vector2i(-1, -1),  Vector2i(0, -1), Vector2i(1, -1), Vector2i(-1, 0), Vector2i(1, 0), Vector2i(-1, 1),  Vector2i(0, 1), Vector2i(1, 1),
				Vector2i(-1, -2),  Vector2i(0, -2), Vector2i(1, -2), Vector2i(-1, 0), Vector2i(1, 0), Vector2i(-1, 1),  Vector2i(0, 1), Vector2i(1, 1)]
	set_cells_terrain_connect(0, temp, 0, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
