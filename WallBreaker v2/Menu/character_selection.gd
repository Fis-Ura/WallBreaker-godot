extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_controls()
	
func _controls():
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Menu/mainMenu.tscn")
