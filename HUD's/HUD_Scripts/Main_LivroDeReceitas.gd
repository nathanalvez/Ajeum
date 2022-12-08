extends Control

var isLivroReceitasVisible = false #booleana que controla se o menu de pause está visível ou não

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (isLivroReceitasVisible): #se está pausado
		show() #mostrar menu de pause
	else:#se ele não está pausado
		hide() #não mostrar o menu de pause.

func _on_Receita_pressed():
	if (isLivroReceitasVisible == true):
		isLivroReceitasVisible = false
	else:
		isLivroReceitasVisible = true

func _on_Exit_pressed():
	isLivroReceitasVisible = false


