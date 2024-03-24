extends Label

#the categories
var Genre = ["Action", "Adventure", "Comedy", "Mystery", "Fantasy", "Biopic", "Horror", "Romance", "Sci-Fi", "Thriller"]
var NSActor = ["Johnathan Saynah", "Ronald Donson", "Crisped Rat", "Jorge Cronie", "Bradley Pradley", "Fritz Wagner", "Desmond James", "Seamus Eel Jameson", "Isaac Ospray", "Donald Beefstick", "Shark Hamilton", "Timmy Chamomile", "Shaun Bhaun", "Daniel Bropheto", "Wheel Forreal", "Velvet Yohanessun", "Gentrifer Notalawyer", "Sandy Sowock", "Emma Holmes", "Kate Losedeny", "Zaneyba", "Windex Turkilton", "Natascha Docksir", "Coolia Bobs", "Grease Withaknife"]
var Zhuzh = ["Animated","Period-Piece", "Stop Motion", "Claymation", "Musical", "Sequel", "Prequel", "Reboot", "Adaptation", "Famous Director", "Good Score"]

#the titles
var stAction = ["Bullet ", "Last Man ", "Thunder ", "Deadly "]
var edAction = ["Fury", " Retribution", "Protocall", "Standoff"]
var stAdventure = ["Quest ", "Mystic Island ", "The Enigma of ", "The Lost Horizon "]
var edAdventure = ["Across Time", "The Crystal City", "The Ancient Curse", "The Serpents Tomb"]
var stComedy = ["The Giggle ", "Jocular ", "Zany ", "Whimsical "]
var edComedy = ["Carnival", "Shenanigans", "Mayhem", "Jamboree"]
var stMystery = ["Whispers of ", "The Secrets of ", "The Curious Case of ", "Labrinthian "]
var edMystery = ["Suspicion", "Hollow Manor", "Doubt", "Midnight"]
var stFantasy = ["Realm of " , "Wizards of ", "Journey to ", "Chronicles of "]
var edFantasy = ["Magic", "The Faerie Ring", "Shadows", "Eternity"]
var stBiopic = ["Rising from Nothing: ", "Beyond the Headlines: ", "The True Story of ", "Living the Dream: "]
var edBiopic = ["A True Story", "The Real Events", "The Untold Story", "A Biopic"]
var stHorror = ["Nightmare of ", "The Haunting of ", "Phantom's ", "Terror of "]
var edHorror = ["Hollow Hill", "Banshee", "Shadows", "Blackwood Estate"]
var stRomance = ["Love's ", "Chasing ", "Destiny ", "The Promise of "]
var edRomance = ["Memories", "Sunsets", "Love", "Forever"]
var stScifi = ["Eclipse of ", "Astral ", "Galaxy's ", "The Solaris "]
var edScifi = ["Cosmos", "Paradox", "Nebula", "Legacy"]
var stThriller = ["Beyond ", "The Vanishing of ", "The Final ", "No Colder "]
var edThriller = ["Breath", "Rooms", "Confrontation", "Redemption"]

@export var scTitle = "Title"
@export var scGenre = ["Gone", "Gtwo"]
@export var scNSActor = ["Aone", "Atwo"]
@export var scZhuzh = ["Zone", "Ztwo"]

@onready var scIn = get_parent()
@onready var trendy = get_parent().get_parent().get_node("Phone")

# Called when the node enters the scene tree for the first time.
func _ready():
	new_script()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func new_script():
	set_genres()
	set_actors()
	set_zhuzhs()
	set_title()
	trendComp()
	writeToScript()

func set_genres():
	scGenre = [Genre[randi_range(0,9)],Genre[randi_range(0,9)]]

func set_actors():
	scNSActor = [NSActor[randi_range(0,24)],NSActor[randi_range(0,24)]]

func set_zhuzhs():
	scZhuzh = [Zhuzh[randi_range(0,10)],Zhuzh[randi_range(0,10)]]

func writeToScript():
	var scriptText = scTitle + "\n"
	if scGenre[0] == scGenre[1]:
		scriptText += scGenre[0] + "\n"
	else:
		scriptText += scGenre[0] + "/" + scGenre[1] + "\n"
	if scNSActor[0] == scNSActor[1]:
		scriptText += scNSActor[0] + "\n"
	else: 
		scriptText += scNSActor[0] + " & " + scNSActor[1] + "\n"
	if scZhuzh[0] == scZhuzh[1]:
		scriptText += scZhuzh[0] + "\n"
	else:
		scriptText += scZhuzh[0] + "-" + scZhuzh[1] + "\n"
	scriptText += "$" + str(scIn.cost)
	text = scriptText

func set_title():
	var start
	var end
	# first half of title
	if scGenre[0] == "Action":
		start = stAction[randi_range(0,3)]
	elif scGenre[0] == "Adventure":
		start = stAdventure[randi_range(0,3)]
	elif scGenre[0] == "Comedy":
		start = stComedy[randi_range(0,3)]
	elif scGenre[0] == "Mystery":
		start = stMystery[randi_range(0,3)]
	elif scGenre[0] == "Fantasy":
		start = stFantasy[randi_range(0,3)]
	elif scGenre[0] == "Biopic":
		start = stBiopic[randi_range(0,3)]
	elif scGenre[0] == "Horror":
		start = stHorror[randi_range(0,3)]
	elif scGenre[0] == "Romance":
		start = stRomance[randi_range(0,3)]
	elif scGenre[0] == "Sci-Fi":
		start = stScifi[randi_range(0,3)]
	elif scGenre[0] == "Thriller":
		start = stThriller[randi_range(0,3)]
	
	#second half of title
	if scGenre[1] == "Action":
		end = edAction[randi_range(0,3)]
	elif scGenre[1] == "Adventure":
		end = edAdventure[randi_range(0,3)]
	elif scGenre[1] == "Comedy":
		end = edComedy[randi_range(0,3)]
	elif scGenre[1] == "Mystery":
		end = edMystery[randi_range(0,3)]
	elif scGenre[1] == "Fantasy":
		end = edFantasy[randi_range(0,3)]
	elif scGenre[1] == "Biopic":
		end = edBiopic[randi_range(0,3)]
	elif scGenre[1] == "Horror":
		end = edHorror[randi_range(0,3)]
	elif scGenre[1] == "Romance":
		end = edRomance[randi_range(0,3)]
	elif scGenre[1] == "Sci-Fi":
		end = edScifi[randi_range(0,3)]
	elif scGenre[1] == "Thriller":
		end = edThriller[randi_range(0,3)]
	
	#concatanate first and second half of title
	
	scTitle = start + end
	
	if scZhuzh[0] == "Sequel" or scZhuzh[1] == "Sequel":
		scTitle += " 2"
	
	if scZhuzh[0] == "Prequel" or scZhuzh[1] == "Prequel":
		scTitle += " 1/2"
	
	if scZhuzh[0] == "Musical" or scZhuzh[1] == "Musical":
		scTitle += " The Musical"
		
func trendComp():
	scIn.cost = 500000
	if trendy.trGenre == scGenre[0]:
		scIn.cost += 50000
	if trendy.trGenre == scGenre[1]:
		scIn.cost += 50000
	if trendy.trActor == scNSActor[0]:
		scIn.cost += 50000
	if trendy.trActor == scNSActor[1]:
		scIn.cost += 50000
	if trendy.trZhuzh == scZhuzh[0]:
		scIn.cost += 50000
	if trendy.trZhuzh == scZhuzh[1]:
		scIn.cost += 50000
