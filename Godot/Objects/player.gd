extends CharacterBody2D

var speed: int = 3
var size: int = 9
@onready var room = get_parent()
var kiBlast = preload("res://Objects/ki_blast.tscn")
var kiAvailable: bool = false

func _ready():
	$AnimationPlayer.play(str(size))

func _physics_process(_delta):
	$AnimationPlayer.play(str(size))
	
	if Input.is_key_pressed(KEY_SPACE) and kiAvailable:
		kiBlastShoot()
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1 * speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 * speed
	move_and_collide(velocity)

func enlargePlayer():
	if size < 16:
		size += 1
		
func minimizePlayer():
	if size > 0:
		size -= 1
		
func kiBlastShoot():
	var newObj = kiBlast.instantiate()
	newObj.position = position + Vector2(0, -10)
	room.add_child(newObj)
	kiAvailable = false
