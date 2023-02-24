extends Node

var nextLevel = null

@onready var currentLevel = $Overworld
@onready var anim = $AnimationPlayer
@onready var colorArea = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	currentLevel.connect("level_changed", handleLevelChanged)
	colorArea.visible = false


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
	
	# make color visable and play animation
	colorArea.visible = true
	anim.play("PaintItBlack")
	await anim.animation_finished
	
	nextLevel = load("res://Rooms/" + nextLevelName + ".tscn").instantiate()
	add_child(nextLevel)
	move_child(nextLevel, 0)
	nextLevel.connect("level_changed", handleLevelChanged)
#	transfer_data_between_scenes(currentLevel, nextLevel)
	remove_child(currentLevel)
	currentLevel = nextLevel
	nextLevel = null
	
	anim.play("PaintItClear")
	await anim.animation_finished
	colorArea.visible = false


func transfer_data_between_scenes(old_scene, new_scene):
	new_scene.load_level_parameters(old_scene.level_parameters)

