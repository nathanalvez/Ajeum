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

func _ready():
	currentState = States.Walking
	print(type)

func _physics_process(delta):
	count += 0.1
	emit_signal("delay", count)
	emit_signal("StateMachine", currentState)
	
	match currentState:
		States.Walking:
			Walk()
		States.Default:
			Default()
		States.Ordering:
			Ordering()
		States.Waiting:
			pass
			 

func Walk():
	targetPosition = get_parent().get_node("Player").position

	myPosition = position.direction_to(targetPosition) * speed

	if position.distance_to(targetPosition) > 100:
		myPosition = move_and_slide(myPosition)
	else:
		if type == TipoCliente.Normal:
			print("apenas sentar-se.")
			currentState = States.Default
		else:
			print("Esperar alguém puxar a cadeira para ele.")
			currentState = States.Waiting

func Default():
	print("Default")
	currentState = States.Ordering
	
func Ordering():
	print("fazendo Pedido")
	currentState = States.Waiting
