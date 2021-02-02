extends HBoxContainer

func update_item(item_name:String):
	var icon:TextureRect = $Icon
	var label:Label = $Label
	var item = Global.item[item_name]
	icon.texture = item["icon"]
	label.text = item["name"]
