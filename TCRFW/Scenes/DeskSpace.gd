extends Node2D

@onready var Money = get_node("MoneyTrack")
@onready var Week = get_node("Time per week")
@onready var Trendy = get_node("Phone")
@onready var Paper = get_node("NoteBookPaper")
@onready var ZMat = get_node("ZMatch")
@onready var ZNMat = get_node("ZNoMatch")
@onready var GMat = get_node("GMatch")
@onready var GNMat = get_node("GNoMatch")
@onready var AMat = get_node("AMatch")
@onready var ANMat = get_node("ANoMatch")
@onready var DateTime = get_node("DateTrack")

signal scriptTimeout
signal newTrends
signal notePaperIn
signal notePaperOut
signal scoreScreenIn

var CashMonies = 3000000
var moniesPerWeek = 110000
var activeScript = false
var scriptTime = 0
var boxOffice = 1
var keptSc = false
var dueTime:int = 0
var year = 1
var month = 1
var week = 1



@export var csGenres = ["G1", "G2"]
@export var csActors = ["A1", "A2"]
@export var csZhuzhs = ["Z1", "Z2"]
@export var csTitle = "T"
@export var finalSc = 0
@export var times:int = 0
@export var scriptNum = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	Money.text = "$" + str(snapped(CashMonies,0))
	Week.wait_time = 3
	GMat.hide()
	GNMat.hide()
	AMat.hide()
	ANMat.hide()
	ZMat.hide()
	ZNMat.hide()
	primLogic()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Money.text = "$" + str(CashMonies)
	pass

func primLogic():
	while times < 72:
		Week.start()
		await Week.timeout
		updateDate(times)
		print(times)
		GMat.hide()
		GNMat.hide()
		AMat.hide()
		ANMat.hide()
		ZMat.hide()
		ZNMat.hide()
		emit_signal("newTrends")
		if(CashMonies <= 0):
			print("BooWhomp")
			CashMonies = 0
			break
		if(activeScript):
			trendMatchVisibility()
			emit_signal("notePaperIn")
			scriptTime += 1
			scVsTr(dueTime)
			if(scriptTime == 4):
				if(keptSc == true):
					scriptTime = 0
					dueTime = 1
				else:
					emit_signal("scriptTimeout")
					dueTime = 0
					activeScript = false
					scriptTime = 0
					scriptNum += 1
				emit_signal("notePaperOut")
		else:
			moniesPerWeek = -100000
		print(moniesPerWeek)
		CashMonies += moniesPerWeek
		times += 1 
	print(times)
	finalScore(times)
	emit_signal("scoreScreenIn")
	


# compare categories of selected script and trends
func scVsTr(extra:int):
	var exter = 1
	if(extra == 1):
		exter = -1
		boxOffice = 4
	else:
		exter = 2
		boxOffice = 1 
	var trendsMatched = 0
	moniesPerWeek = 100000
	if csGenres[0] == Trendy.trGenre:
		print("G1 match!")
		trendsMatched+=1
	if csGenres[1] == Trendy.trGenre:
		print("G2 match!")
		trendsMatched+=1
	if csActors[0] == Trendy.trActor:
		print("A1 match!")
		trendsMatched+=1
	if csActors[1] == Trendy.trActor:
		print("A2 match!")
		trendsMatched+=1
	if csZhuzhs[0] == Trendy.trZhuzh:
		print("Z1 match!")
		trendsMatched+=1
	if csZhuzhs[1] == Trendy.trZhuzh:
		print("Z2 match!")
		trendsMatched+=1
	
	if trendsMatched == 0:
		moniesPerWeek *= 1*exter/abs(exter)*boxOffice
	elif trendsMatched == 1:
		moniesPerWeek *= 1.25*boxOffice
	elif trendsMatched == 2:
		moniesPerWeek *= 1.35*boxOffice
	elif trendsMatched == 3:
		moniesPerWeek *= 1.45*boxOffice
	elif trendsMatched == 4:
		moniesPerWeek *= 1.1*boxOffice*exter
	elif trendsMatched == 5:
		moniesPerWeek *= 0.4*boxOffice*exter
	elif trendsMatched == 6: 
		moniesPerWeek *= 0.35*boxOffice*exter

func trendMatchVisibility():
	if csGenres[0] == Trendy.trGenre or csGenres[1] == Trendy.trGenre:
		GMat.show()
		GNMat.hide()
	else:
		GNMat.show()
		GMat.hide()
	if csActors[0] == Trendy.trActor or csActors[1] == Trendy.trActor:
		AMat.show()
		ANMat.hide()
	else:
		ANMat.show()
		AMat.hide()
	if csZhuzhs[0] == Trendy.trZhuzh or csZhuzhs[1] == Trendy.trZhuzh:
		ZMat.show()
		ZNMat.hide()
	else:
		ZNMat.show()
		ZMat.hide()

func updateDate(times:int):
	var dateScript = "Year: "
	if week < 3:
		week +=1
	else:
		week = 1
	if week == 3:
		month += 1
	if month == 13:
		year = 2
		month = 1
		week = 1
	DateTime.text = dateScript + str(year) + "\nMonth: " + str(month) + "\nWeek: " + str(week)

func finalScore(times:int):
	if CashMonies != 0:
		finalSc = round(times*(CashMonies+1)*(scriptNum)/10000)
	else:
		finalSc = times*(scriptNum)
	print("Score: ", finalSc)
	pass

func _on_script_one_caching():
	CashMonies -= get_node("Script One").cost
	csGenres = get_node("Script One").scText.scGenre
	csActors = get_node("Script One").scText.scNSActor
	csZhuzhs = get_node("Script One").scText.scZhuzh
	csTitle = get_node("Script One").scText.scTitle
	activeScript = true


func _on_script_two_caching():
	CashMonies -= get_node("Script Two").cost
	csGenres = get_node("Script Two").scText.scGenre
	csActors = get_node("Script Two").scText.scNSActor
	csZhuzhs = get_node("Script Two").scText.scZhuzh
	csTitle = get_node("Script Two").scText.scTitle
	activeScript = true

func _on_note_book_paper_keep_script():
	keptSc = true


func _on_note_book_paper_scrap_script():
	keptSc = false
