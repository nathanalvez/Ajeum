extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _on_Start_Button_pressed():
	print("Está funcionando")
	get_tree().change_scene("res://Scenes/Main.tscn")

