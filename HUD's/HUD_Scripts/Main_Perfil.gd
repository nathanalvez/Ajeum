extends Control

var isPerfilVisible = false;

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (isPerfilVisible):
		show()
	else:
		hide()

func _on_Perfil_pressed():
	if (isPerfilVisible == true):
		isPerfilVisible = false
	else:
		isPerfilVisible = true


func _on_Exit_pressed():
	isPerfilVisible = false
