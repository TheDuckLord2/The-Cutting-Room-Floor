extends Button


# Called when the node enters the scene tree for the first time.

var ogScale = scale

func _ready():
	pass # Replace with function body.



func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/LoadScreen.tscn")
