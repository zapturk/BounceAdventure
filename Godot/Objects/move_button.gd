extends Area2D

@export var dir:String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Fade")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if global_position.x < -160:
		visible = false
	if global_position.x > 160:
		visible = false
	if global_position.y < -160:
		visible = false
	if global_position.y > 160:
		visible = false


func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_parent().move(dir)
