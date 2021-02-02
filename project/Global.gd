extends Node

var item = {}
var recipe = {}
var icon_color = {}

var icon_size = Vector2(42, 42)

#item id => iitem name. We use itemid as id for slots in nodes
var item_id = {}

func _ready():
	var file = File.new()
	file.open("res://data/dsp_recipedumper.json", file.READ)
	var text = file.get_as_text()
	file.close()
	var recipedump = JSON.parse(text).result
	
	file.open("res://data/icon_color.json", file.READ)
	text = file.get_as_text()
	file.close()
	var raw_color = JSON.parse(text).result
	
	_setup_item_data(recipedump["item"])
	_setup_recipe_data(recipedump["recipe"])
	_setup_color_data(raw_color)

func _setup_color_data(raw_color):
	for iname in raw_color:
		var c = raw_color[iname]
		var color = Color(c[0] / 255, c[1] / 255, c[2] / 255)
		icon_color[iname] = color

func _setup_item_data(item_raw):
	var id=1
	for iname in item_raw:
		var i = item_raw[iname]
		item[iname] = i
		item[iname]["id"] = id
		
		# Arrays to store recipe names 
		item[iname]["product"] = []
		item[iname]["intermidiate"] = []
	
		# set icon graphic
		var icon = "res://icons/%s.png" % iname
		if not _file_exists(icon):
			icon = "res://icons/unknown.png"

		item[iname]["icon"] = load(icon)
			
		item_id[id] = iname
		
		id += 1

func _file_exists(filename):
		var file_check = File.new()
		var do_file_exists = file_check.file_exists(filename)
		return do_file_exists

func _setup_recipe_data(recipe_raw):
	recipe = recipe_raw
	
	# add recipe name to corresponding items
	for rname in recipe_raw:
		var r = recipe_raw[rname]
		for iname in r["items"]:
			item[iname]["intermidiate"].append(rname)
		for iname in r["results"]:
			item[iname]["product"].append(rname)
