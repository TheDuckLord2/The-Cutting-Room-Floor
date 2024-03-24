extends Sprite2D

@onready var scalar = Vector2(1.348,1.306)
@onready var areaSig = get_node("Area2D")

@onready var GT = get_node("GT")
@onready var AT = get_node("AT")
@onready var ZT = get_node("ZT")

#I know that there is a better way of doing this but I really don't feel like doing that rn, to fix later
var Genre = ["Action", "Adventure", "Comedy", "Mystery", "Fantasy", "Biopic", "Horror", "Romance", "Sci-Fi", "Thriller"]
var NSActor = ["Johnathan Saynah", "Ronald Donson", "Crisped Rat", "Jorge Cronie", "Bradley Pradley", "Fritz Wagner", "Desmond James", "Seamus Eel Jameson", "Isaac Ospray", "Donald Beefstick", "Shark Hamilton", "Timmy Chamomile", "Shaun Bhaun", "Daniel Bropheto", "Wheel Forreal", "Velvet Yohanessun", "Gentrifer Notalawyer", "Sandy Sowock", "Emma Holmes", "Kate Losedeny", "Zaneyba", "Windex Turkilton", "Natascha Docksir", "Coolia Bobs", "Grease Withaknife"]
var Zhuzh = ["Animated","Period-Piece", "Stop Motion", "Claymation", "Musical", "Sequel", "Prequel", "Reboot", "Adaptation", "Famous Director", "Good Score"]

var stSocials = ["Man, I sure do love ", "I wish there were more ", "", "Why aren't there more "]
var edSocials = ["!", " movies...", " is so in right now I love it.", " movies out!"]

@export var trGenre = "Genre"
@export var trActor = "Actor"
@export var trZhuzh = "Zhuzh"

var ogPos = Vector2(1039,408)
var centerPos = Vector2(588,309)
var bigScalar = Vector2(4.429, 4.31)
var multiplier = 1.1
var socialNum = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	areaSig.mouse_entered.connect(_on_mouse_enter)
	areaSig.mouse_exited.connect(_on_mouse_exit)
	socialNum = randi_range(0,3)
	trGenre = Genre[randi_range(0,9)]
	trActor = NSActor[randi_range(0,24)]
	trZhuzh = Zhuzh[randi_range(0,10)]
	GT.text = stSocials[socialNum] + trGenre + edSocials[socialNum]
	socialNum = randi_range(0,3)
	AT.text = stSocials[socialNum] + trActor + edSocials[socialNum]
	socialNum = randi_range(0,3)
	ZT.text = stSocials[socialNum] + trZhuzh + edSocials[socialNum]
	scale = scalar
	position = ogPos
	
	pass # Replace with function body.

func _on_mouse_enter():
	scale = scale*multiplier
	
func _on_mouse_exit():
	scale = scalar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	var tween = get_tree().create_tween()
	if (event is InputEventMouseButton && event.pressed):
		multiplier = 1
		tween.tween_property(self, "position", centerPos, 0.2)
		tween.tween_property(self, "scale", bigScalar, 0.2)
	else:
		multiplier = 1.1
		tween.tween_property(self, "position", ogPos, 0.2)
		tween.tween_property(self, "scale", scalar, 0.2)


func _on_node_2d_new_trends():
	var trendNum = randi_range(1,3)
	if trendNum == 1:
		socialNum = randi_range(0,3)
		trGenre = Genre[randi_range(0,9)]
		GT.text = stSocials[socialNum] + trGenre + edSocials[socialNum]
	if trendNum == 2:
		trActor = NSActor[randi_range(0,24)]
		socialNum = randi_range(0,3)
		AT.text = stSocials[socialNum] + trActor + edSocials[socialNum]
	if trendNum == 3:
		trZhuzh = Zhuzh[randi_range(0,10)]
		socialNum = randi_range(0,3)
		ZT.text = stSocials[socialNum] + trZhuzh + edSocials[socialNum]
	pass # Replace with function body.
