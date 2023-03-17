extends StaticBody2D

var powerUp = preload("res://Objects/power_up.tscn")
@onready var room = get_parent().get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func destroyBrick():
	var newObj = powerUp.instantiate()
	newObj.position = position
	room.add_child(newObj)
	queue_free()
