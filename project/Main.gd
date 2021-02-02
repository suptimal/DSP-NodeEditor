extends GraphEdit

onready var header_box = get_zoom_hbox()
onready var item_list_container = $CenterContainer

func _ready():
	var item_list_toggle = Button.new()
	header_box.add_child(item_list_toggle)
	item_list_toggle.text = "<<< ITEMLIST >>>"
	
	item_list_toggle.connect("pressed", self, "toggle_item_list")
#
func toggle_item_list():
	item_list_container.visible = not item_list_container.visible
