extends Control

var isSomsivisible = false;

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (isSomsivisible):
		show()
	else:
		hide()

func _on_Som_pressed():
	if (isSomsivisible == true):
		isSomsivisible = false
	else:
		isSomsivisible = true


func _on_Exit_pressed():
	isSomsivisible = false
