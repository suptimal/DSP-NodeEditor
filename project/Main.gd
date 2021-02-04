extends Control

#onready var header_box = get_zoom_hbox()
onready var item_list_container = $CenterContainer

func _ready():
#	var item_list_toggle = Button.new()
#	header_box.add_child(item_list_toggle)
#	item_list_toggle.text = "<<< ITEMLIST >>>"
#
#	item_list_toggle.connect("pressed", self, "toggle_item_list")

	pass
func toggle_item_list():
	var isvis = not item_list_container.visible
	item_list_container.visible = isvis
	var anchor_pos = 1
	if isvis:
		anchor_pos = 0
	item_list_container.anchor_left = anchor_pos
	item_list_container.anchor_top = anchor_pos
	
	


func _on_GraphEdit_popup_request(position):
	toggle_item_list()
	pass # Replace with function body.
