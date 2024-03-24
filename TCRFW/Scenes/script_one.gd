extends Sprite2D

@onready var areaSig = get_node("Area2D")
@onready var scText = get_node("ScriptText")
@onready var ogPos = position
@onready var trendy = get_parent().get_node("Phone")
@onready var paper = get_parent().get_node("NoteBookPaper")
@onready var sounds = get_node("SwooshyNoise")

@export var cost = 500000

signal schmove
signal caching

var tweenPos = Vector2(587,-438)
# Called when the node enters the scene tree for the first time.
func _ready():
	areaSig.mouse_entered.connect(_on_mouse_enter)
	areaSig.mouse_exited.connect(_on_mouse_exit)
	schmove.connect(_script_moved)
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_enter():
	scale = Vector2(1.709,1.696)
	
func _on_mouse_exit():
	scale = Vector2(1.424,1.413)
	
func _script_moved():
	var tween = get_tree().create_tween()
	sounds.play()
	tween.tween_property(self, "position", tweenPos, 0.2)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("caching")
		emit_signal("schmove")

func _on_script_two_schmove():
	_script_moved()

func _on_script_one_schmove():
	_script_moved()

func _on_node_2d_script_timeout():
	var tween = get_tree().create_tween()
	scText.new_script()
	tween.tween_property(self, "position", ogPos, 0.2)
	pass # Replace with function body.

