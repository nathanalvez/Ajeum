extends KinematicBody2D

enum ClassesPersonagem {
	Guerreiro,
	Ladino,
	Mago,
	Default
}

var classeAtual = ClassesPersonagem.Default
var vida = 0
var mana = 0
var defesa = 0
var magia = 0
var ataque = 0

func _ready():
	classeAtual = ClassesPersonagem.Guerreiro

func _physics_process(delta):
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
	print("É um guerreiro")

func Ladino():
	print("É um ladino")

func Mago():
	print("É um mago")
