extends HBoxContainer


func update_recipe(recipe_name:String):
	var input_box : HBoxContainer = $Input
	var output_box : HBoxContainer = $Output
	var time_label : Label = $TimeContainer/VBox/Label
	var recipe = Global.recipe[recipe_name]
	time_label.text = str(recipe["timeSpend"] / 60)
	
	for child in input_box.get_children():
		child.queue_free()
	for child in output_box.get_children():
		child.queue_free()
	
	for iname in recipe["items"]:
		var tex_rect = build_texutre_rect(Global.item[iname]["icon"])
		input_box.add_child(tex_rect)
	
	for iname in recipe["results"]:
		var tex_rect = build_texutre_rect(Global.item[iname]["icon"])
		output_box.add_child(tex_rect)

func build_texutre_rect(texture):
	var tex_rect = TextureRect.new()
	tex_rect.texture = texture
	tex_rect.expand = true
	tex_rect.rect_min_size = Global.icon_size
	tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
	return tex_rect
