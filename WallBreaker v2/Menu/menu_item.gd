extends Label

#this method is only used in conjunction with the menu_underline.gd
#if the item in the list are label not buttons


signal cursor_selected()

func cursor_select() -> void:
	print(name)
	emit_signal("cursor_selected")
