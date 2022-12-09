extends KinematicBody2D

signal delay (countValue)
signal StateMachine (current)

enum TipoCliente {
	Normal,
	Famoso
}

enum States {
	Default,
	Entering,
	Walking,
	Sitting, 
	Ordering,
	Waiting,
	Getting_Up,
	Grabbing_Dish,
	Grabbing_Cup,
	Filling_Cup,
	Eating,
	Approving
	Disapproving,
	Paying,
	Complaining,
}

var count = 0

export var currentState = States.Default
export var type = TipoCliente.Normal

var targetPosition = 0
var myPosition = Vector2()
export var speed = 200

export var waypoints = []
var currentPoint = 0

export var caminho = 0;

func _ready():
	currentState = States.Walking

func _physics_process(delta): 
	count += 0.1
	emit_signal("delay", count) 
	emit_signal("StateMachine", currentState)

	match currentState:
		States.Walking:
			Walk()

func _process(delta):
	pass

func Walk():
	
	for i in range(waypoints.size()):
		i = currentPoint
		targetPosition = get_parent().get_node("Waypoint" + str(caminho) + "/" + waypoints[i]).position
		break 

	myPosition = position.direction_to(targetPosition) * speed

	if position.distance_to(targetPosition) > 10:
		myPosition = move_and_slide(myPosition) 
	else: 
		currentPoint += 1

	if currentPoint >= waypoints.size():
		currentState = States.Default
