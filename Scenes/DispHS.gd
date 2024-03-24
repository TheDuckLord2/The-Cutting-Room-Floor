extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var hs = OnStartup.save_data.high_score
	text = str(hs) + "\npoints"
	pass # Replace with function body.

