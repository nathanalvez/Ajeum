extends KinematicBody2D

signal PathOffset (Offset)
var pathOffset = 0

enum TipoCliente {
	Normal,
	Famoso
}

enum States {
	default,
	walking,
	onTable,
}

export var currentType = TipoCliente.Normal
var state = States.walking
export var paths = []

var pathToFollow = Vector2()
var myPosition = Vector2()
var speed = 200
var count = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	SignalsEmit()
	pathToFollow = get_parent().get_node("path1/path_follow").position
	match state:
		States.walking:
			Walking()
		States.onTable:
			OnTable()

func Walking():
	myPosition = position.direction_to(pathToFollow) * speed

	if position.distance_to(pathToFollow) > 2:
		myPosition = move_and_slide(myPosition) 
	else:
		pathOffset += 0.001
	
	if pathOffset > 1:
		pathOffset = 0
		$AnimatedSprite.play("direita")

func OnTable():
	count += 0.1
	if count > 10:
		state = States.walking
	print(count)

func SignalsEmit():
	emit_signal("PathOffset", pathOffset)


func _on_Table_body_entered(body):
	$AnimatedSprite.play("esquerda")
