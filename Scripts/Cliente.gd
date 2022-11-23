#Necessita que tenha um objeto na cena com a nomenclatura parecida com Waypoint1
#Temos uma intrucao que utiliza esse padrao de nomenclatura para ler o caminho a ser percorrido ate uma mesa
#Tomar cuidado para a variavel chamada "caminho" ter um valor que nao esta registrado como conjunto de caminhos


extends KinematicBody2D #tipo do objeto/node


#sinais proprios/ custom signals.
#sao formas de externalizar um valor para outros nodes.
signal delay (countValue)
signal StateMachine (current)


#enumerator => tipo de variavel para darmos nomes a numeros.
# Ex: normal == 0    ---    Famoso == 1
enum TipoCliente {
	Normal,
	Famoso
}

enum States {
	Default,
	Walking, 
	Ordering,
	Waiting,
}

# bloco para declarar variáveis.
# variáveis tem tipos:
# var int = 0;
# var float = 0.1;
# var boolean = true/false;
# var string = "texto";
# var Vector2 = new Vector2(x, y);
# var Array = [0, 1, 2, 3, 4]  <<< pode armazenar também outros tipos de variáveis.

# Export serve para exibirmos a variável no inspector do godor, para não precisar editar o codigo sempre.
# no unity o "Export" é chamado de [SerializeField]
# lembrando que no godot/phyton o tipo da variável é definido pelo valor de saída.

var count = 0

export var currentState = States.Default
export var type = TipoCliente.Normal

var targetPosition = 0
var myPosition = Vector2()
var speed = 200

export var waypoints = []
var currentPoint = 0

export var caminho = 0;

func _ready(): # funcao que executa antes de todas as outras e apenas uma vez
	currentState = States.Walking

func _physics_process(delta): # diferente de _process, o physics leva em consideracao o relogio.
	count += 0.1
	emit_signal("delay", count) # passando para o meu custom signal o valor da variavel count.
	emit_signal("StateMachine", currentState)

	match currentState: # é o switch em outras linguagens e é basicamente um conjunto de ifs que não executam juntos.
		States.Walking: #exemplo de como chamar os valores do enumerator.
			Walk() # chamada de função.

func _process(delta): # executa a cada frame de acordo com a velocidade da maquina.
	pass

func Walk(): #funcão custom para ser chamado dentro do match/switch
	# for não é um loop infinito.
	for i in range(waypoints.size()): # for é um tipo de loop que executa X vezes dependendo do valor da variável.
		i = currentPoint
		targetPosition = get_parent().get_node("Waypoint" + str(caminho) + "/" + waypoints[i]).position #linha responsavel por armazenar a posição dos points do array
		# a linha de cima também armazena a posição de um alvo para ir na direção do mesmo.
		print(waypoints[i]) #print() coloca coisas no console, muito bom para sabermos quais informações estamos lendo.
		break # o break para o loop.

	#está aplicando uma força em direção ao targetPosition.
	myPosition = position.direction_to(targetPosition) * speed

	#enquanto ele não estiver perto do target, ele continua indo em sua direção.
	if position.distance_to(targetPosition) > 10:
		myPosition = move_and_slide(myPosition) #aplica uma força para mover o objeto.
	else: #se ele não está andando, significa que chegou, então vá para o proximo.
		currentPoint += 1

	#if projetado para evitar erros. Quando o currentPoint for maior que o tamanho do array, eu paro de andar.
	if currentPoint >= waypoints.size():
		currentState = States.Default
