extends Node2D

var ballCount: int = 0
var ball = preload("res://Objects/ball.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("BallCreated", ballCreate)
	add_child(ball)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(ballCount)
	pass

func ballCreate():
	ballCount += 1
