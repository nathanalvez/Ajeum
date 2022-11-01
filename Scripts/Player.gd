extends KinematicBody2D

enum ClassesPersonagem {
	Guerreiro,
	Ladino,
	Mago,
	Default
}

export var classeAtual = ClassesPersonagem.Default
export var vida = 0
export var mana = 0
export var defesa = 0
export var magia = 0
export var ataque = 0

export (int) var speed = 300

var velocity = Vector2()

func _ready():
	classeAtual = ClassesPersonagem.Guerreiro

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	match classeAtual:
		ClassesPersonagem.Guerreiro:
			StatusBase(200, 20, 100, 10, 0)
			Guerreiro()

		ClassesPersonagem.Ladino:
			StatusBase(100, 100, 20, 100, 0)
			Ladino()

		ClassesPersonagem.Mago:
			StatusBase(50, 150, 20, 0, 100)
			Mago()

func StatusBase(_vida, _mana, _defesa, _ataque, _magia):
	vida = _vida
	mana = _mana
	defesa = _defesa
	ataque = _ataque
	magia = _magia

func Guerreiro():
	pass

func Ladino():
	pass

func Mago():
	pass
