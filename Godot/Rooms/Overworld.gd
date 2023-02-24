extends Node2D

@onready var player = $PlayerOverworld
signal level_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("level_changed", handleLevelChanged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func handleLevelChanged(currentLevelName: String):
	emit_signal("level_changed", currentLevelName)
