extends Node2D

var ballCount: int = 0
var ball = preload("res://Objects/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	createBall()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if ballCount == 0:
		createBall()
	pass
	
func createBall():
	add_child(ball.instantiate())
	print("ball created")

func ballCreated():
	ballCount += 1
	
func ballKilled():
	ballCount -= 1
