extends TextureRect

#makes a variable that we can set the the parent node of the menu list we have
@export var menu_parent_path : NodePath
#get the cursor index is not the cursor will jump back to the first item
@export var cursor_offset : Vector2
#makes an integer with the list of the menu
@onready var menu_parent := get_node(menu_parent_path)
#store the integer of the menu list
var cursor_index : int = 0
#set the bird animation
@onready var Birdanim = $birdAnim

func _ready():
	Birdanim.play("Fly")

func _process(delta):
	var input := Vector2.ZERO
	
	if Input.is_action_just_pressed("ui_up"):
		input.y -= 1
	if Input.is_action_just_pressed("ui_down"):
		input.y += 1
	if Input.is_action_just_pressed("ui_left"):
		input.x -= 1
	if Input.is_action_just_pressed("ui_right"):
		input.x += 1
		
	if menu_parent is VBoxContainer:
		set_cursor_from_index(cursor_index + input.y)
	elif menu_parent is HBoxContainer:
		set_cursor_from_index(cursor_index + input.x)
	elif menu_parent is GridContainer:
		set_cursor_from_index(cursor_index + input.x + input.y * menu_parent.columns)
		
	#this method only works if the element in the list are label not buttons
	if Input.is_action_just_pressed("ui_select"):
		var current_menu_item := get_menu_item_at_index(cursor_index)
		if current_menu_item != null:
			if current_menu_item.has_method("cursor_select"):
				current_menu_item.cursor_selec() #needs menu label to have the script applied

#get a function to get the menu item index integer and returning a control node
func get_menu_item_at_index(index : int) -> Control:
	if menu_parent == null:
		return null
		
	if index >= menu_parent.get_child_count() or index < 0:
		return null
	
	return menu_parent.get_child(index) as Control

func set_cursor_from_index(index : int) -> void:
	var menu_item := get_menu_item_at_index(index)
	
	if menu_item == null:
		return
		
	var menu_position = menu_item.global_position
	var menu_size = menu_item.size
	
	
	global_position = Vector2(menu_position.x, menu_position.y + (menu_size.y / 2.0)) - (size / 2.0) - cursor_offset
	cursor_index = index
	
	#print(global_position)
	#print(position.x)
	#print(position.y)
