extends Button

@onready var sound = get_node("DuckSound")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	print("Quack!")
	sound.play()
	pass # Replace with function body.
