extends Line2D

@export var length:int = 30
@onready var kiBlast = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	clear_points()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_point(kiBlast.global_position)
	
	if points.size() > length:
		remove_point(0)

func start():
	clear_points()
	visible = true
