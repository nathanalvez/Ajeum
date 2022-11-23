extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass


func _on_Cliente_StateMachine(current):
	#text = str(current)
	pass


func _on_Cliente_delay(countValue): #função que referencia o custom signal que criamos no cliente.
	text = str(countValue) #muda o texto em tempo real da label
