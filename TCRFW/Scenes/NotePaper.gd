extends Sprite2D

signal keepScript
signal scrapScript

@onready var loc = position
@onready var cent = Vector2(571,388)
@onready var Scripty = get_parent()
@onready var Labely = get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	toLabel()

func toLabel():
	Labely.text = "Keep Current Script?\n"
	var scriptText = Scripty.csTitle + "\n"
	if Scripty.csGenres[0] == Scripty.csGenres[1]:
		scriptText += Scripty.csGenres[0] + "\n"
	else:
		scriptText += Scripty.csGenres[0] + "/" + Scripty.csGenres[1] + "\n"
	if Scripty.csActors[0] == Scripty.csActors[1]:
		scriptText += Scripty.csActors[0] + "\n"
	else: 
		scriptText += Scripty.csActors[0] + " & " + Scripty.csActors[1] + "\n"
	if Scripty.csZhuzhs[0] == Scripty.csZhuzhs[1]:
		scriptText += Scripty.csZhuzhs[0] + "\n"
	else:
		scriptText += Scripty.csZhuzhs[0] + "-" + Scripty.csZhuzhs[1] + "\n"
	Labely.text += scriptText
	Labely.text += " \nScript will be kept for 4 more Weeks, with a chance for more money, but a chance to lose money."



func _on_keep_pressed():
	emit_signal("keepScript")


func _on_scrap_pressed():
	emit_signal("scrapScript")

func _on_node_2d_note_paper_in():
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", cent, 0.2)


func _on_node_2d_note_paper_out():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", loc, 0.2)
