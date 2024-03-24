extends Sprite2D

@onready var WOL = get_node("Win or Lose")
@onready var TL = get_node("Time Lasted")
@onready var MM = get_node("Money Made")
@onready var SP = get_node("Scripts Produced")
@onready var FS = get_node("Final Score")
@onready var HS = get_node("High Score")
@onready var Data = get_parent()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_node_2d_score_screen_in():
	if Data.times < 72:
		WOL.text = "Bankruptcy!"
	else:
		WOL.text = "You Made it!"
	TL.text += str(Data.times)
	MM.text += str(Data.CashMonies)
	SP.text += str(Data.scriptNum)
	FS.text += str(Data.finalSc)
	if(Data.finalSc > OnStartup.save_data.high_score):
		OnStartup.save_data.high_score = Data.finalSc
		OnStartup.save_data.save()
		HS.text += str(OnStartup.save_data.high_score) + " New High Score!"
	else:
		HS.text += str(OnStartup.save_data.high_score)
	position = Vector2(576,324)
	pass # Replace with function body.


func _on_mm_pressed():
	get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")
	pass # Replace with function body.


func _on_na_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
