extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene_to_file("res://Rooms/test_breakout_room.tscn")
	# get the players location
	# go to the play screan uins the locaion
