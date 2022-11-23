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

func get_input(): # funcão da documentação, ela faz uma movimentação para 8 lados.
	velocity = Vector2() #define velocidade para x e y
	if Input.is_action_pressed("right"): #se eu pressionei o botão representado pela string "right" ele executa a ação debaixo.
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	#existe um erro que quando você aperta 2 direcionais ele soma o valor e anda mais rápido.
	#o normalize garante que as velocidades sejam as mesmas para cada direção.
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input() #a chamada da função que contém os ifs para movimentação.
	velocity = move_and_slide(velocity) #aplica uma força para mover o objeto.
	
	match classeAtual: # é o switch em outras linguagens e é basicamente um conjunto de ifs que não executam juntos.
		ClassesPersonagem.Guerreiro:
			StatusBase(200, 20, 100, 10, 0)
			Guerreiro()

		ClassesPersonagem.Ladino:
			StatusBase(100, 100, 20, 100, 0)
			Ladino()

		ClassesPersonagem.Mago:
			StatusBase(50, 150, 20, 0, 100)
			Mago()

func StatusBase(_vida, _mana, _defesa, _ataque, _magia): # função custom para definir os valores de atributos.
	vida = _vida
	mana = _mana
	defesa = _defesa
	ataque = _ataque
	magia = _magia

func Guerreiro(): #função custom a ser chamada dentro do match/switch
	pass

func Ladino():#função custom a ser chamada dentro do match/switch
	pass

func Mago():#função custom a ser chamada dentro do match/switch
	pass
