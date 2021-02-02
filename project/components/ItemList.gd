extends VBoxContainer

onready var recipe_display = preload("res://components/RecipeDisplay.tscn")
onready var item_display = preload("res://components/ItemDisplay.tscn")
onready var grid:GridContainer = $ItemList/GridContainer

func _ready():
	var item_list = {}
	var item_keys = []
	
	var max_recipes = 0
	
	for iname in Global.item:
		var item = Global.item[iname]
		var display_name = item["name"]
		item_list[display_name] = iname
		item_keys.append(display_name)
		
		if max_recipes < len(item["product"]):
			max_recipes = len(item["product"])
	
	grid.columns = max_recipes + 1
	item_keys.sort()
	for k in item_keys:
		var iname = item_list[k]
		var item = Global.item[iname]
		var idisplay = item_display.instance()
		idisplay.name = k.to_upper()
		grid.add_child(idisplay)
		idisplay.update_item(iname)
		
		for rname in item["product"]:
			var rdisplay = recipe_display.instance()
			rdisplay.update_recipe(rname)
			grid.add_child(rdisplay)

		for _i in range(grid.columns - len(item["product"]) -1):
			var empty = Control.new()
			grid.add_child(empty)
	



func _on_LineEdit_text_changed(search_str):
	rect_min_size = rect_size
	for c in grid.get_children():
		c.rect_min_size = c.rect_size
	search_str = search_str.to_upper()
	var item_display_ids = range(0, grid.get_child_count(), grid.columns)
	for id in item_display_ids:
		var idisplay_name = grid.get_child(id).name
		var show = false
		if search_str in idisplay_name or search_str == "":
			show = true
		
		for i in range(id, id+grid.columns):
			grid.get_child(i).visible = show
