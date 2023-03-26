extends Node2D

var brickCount: int = 0
var ball = preload("res://Objects/ball.tscn")
signal level_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	createBall()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $BallHolder.get_child_count() == 0:
		createBall()
	if $BrickHolder.get_child_count() == 0:
		Globals.levelDic[str(Globals.playerX)+str(Globals.playerY)] = true
		Globals.setTiles()
		emit_signal("level_changed", "overworld")
	
func createBall():
	if $BallHolder.get_child_count() < Globals.ballLimit:
		$BallHolder.add_child(ball.instantiate())

func cloneBalls():
	for ballIns in $BallHolder.get_children():
		var newBall = ball.instantiate()
		newBall.position = ballIns.position
		newBall.go = true
		newBall.velocity.y = ballIns.velocity.y
		if $BallHolder.get_child_count() < Globals.ballLimit:
			$BallHolder.add_child(newBall)

func enlargePlayer():
	$Player.enlargePlayer()
	
func minimizePlayer():
	$Player.minimizePlayer()
	
func kiBlast():
	$Player.kiAvailable = true
