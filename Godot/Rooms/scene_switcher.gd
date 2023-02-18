extends Node

var nextLevel = null

@onready var currentLevel = $Overworld

# Called when the node enters the scene tree for the first time.
func _ready():
	currentLevel.connect("level_changed", handleLevelChanged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func handleLevelChanged(currentLevelName: String):
	var nextLevelName: String

	match currentLevelName:
		"overworld":
			nextLevelName = "Overworld"
		"play":
			nextLevelName = "test_breakout_room"
		_:
			return

	nextLevel = load("res://Rooms/" + nextLevelName + ".tscn").instantiate()
#	nextLevel.layer = -1
	add_child(nextLevel)
#	anim.play("fade_in")
	nextLevel.connect("level_changed", handleLevelChanged)
#	currentLevel.queue_free()
	currentLevel = nextLevel
#	currentLevel.layer = 1
	nextLevel = null
	#transfer_data_between_scenes(currentLevel, nextLevel)


func transfer_data_between_scenes(old_scene, new_scene):
	new_scene.load_level_parameters(old_scene.level_parameters)
