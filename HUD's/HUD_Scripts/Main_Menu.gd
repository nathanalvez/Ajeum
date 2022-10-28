extends Control

var isPauseVisible = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (isPauseVisible):
		show()
	else:
		hide()

func _on_Pause_pressed():
	if (isPauseVisible == true):
		isPauseVisible = false
	else:
		isPauseVisible = true

func _on_Exit_pressed():
	isPauseVisible = false
