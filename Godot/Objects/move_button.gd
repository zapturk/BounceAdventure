extends Area2D

@export var dir:String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Fade")

	print(global_position.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !get_parent().moving:
		visible = get_parent().getMoveVisable((global_position.x - 8) / 16, (global_position.y - 8) / 16)


func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_parent().move(dir)
