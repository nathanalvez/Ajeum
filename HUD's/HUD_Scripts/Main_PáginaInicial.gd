extends Control

var isPaginaInicialVisible = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (isPaginaInicialVisible):
		show()
	else:
		hide()

func _on_PaginaInicial_pressed():
	if(isPaginaInicialVisible == true):
		isPaginaInicialVisible = false
	else:
		isPaginaInicialVisible = true

func _on_SairPaginainicial_pressed():
	get_tree().change_scene("res://Scenes/StartScene.tscn")

func _on_Exit_pressed():
	isPaginaInicialVisible = false # Replace with function body.
