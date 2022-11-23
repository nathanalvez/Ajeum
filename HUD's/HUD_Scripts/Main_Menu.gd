extends Control

var isPauseVisible = false #booleana que controla se o menu de pause está visível ou não

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (isPauseVisible): #se está pausado
		show() #mostrar menu de pause
	else:#se ele não está pausado
		hide() #não mostrar o menu de pause.

func _on_Pause_pressed(): #quando pressionarmos o butão, invertemos o valor da booleana.
	if (isPauseVisible == true):
		isPauseVisible = false
	else:
		isPauseVisible = true

func _on_Exit_pressed(): #signal utilizado para fechar o menu de pause.
	isPauseVisible = false
