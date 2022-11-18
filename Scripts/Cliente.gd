extends KinematicBody2D

signal delay (countValue)
signal StateMachine (current)

enum TipoCliente {
	Normal,
	Famoso
}

enum States {
	Default,
	Walking, #<<<<<<<<<<<<<<<
	Ordering,
	Waiting,
}

var count = 0

export var nome = ""

export var currentState = States.Default
export var type = TipoCliente.Normal

var targetPosition = 0
var myPosition = Vector2()
var speed = 200

export var waypoints = []
var currentPoint = 0

func _ready():
	currentState = States.Walking
	print(waypoints.size())

func _physics_process(delta):
	count += 0.1
	emit_signal("delay", count)
	emit_signal("StateMachine", currentState)

	match currentState:
		States.Walking:
			Walk()

func Walk():

	for i in range(waypoints.size()):
		i = currentPoint
		targetPosition = get_parent().get_node(waypoints[i]).position
		print(waypoints[i])
		break

	myPosition = position.direction_to(targetPosition) * speed

	if position.distance_to(targetPosition) > 10:
		myPosition = move_and_slide(myPosition)
	else:
		currentPoint += 1
		#o que ele vai fazer quando ele chegar no objetivo dele.

	if currentPoint >= waypoints.size():
		currentState = States.Default
