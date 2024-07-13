extends CanvasLayer

func _ready():
	$mainMenu/buttonList/gameStart.grab_focus()
	#pass

func _process(delta):
	pass


func _on_game_start_pressed():
	get_tree().change_scene_to_file("res://Menu/character_selection.tscn")

func _on_ranking_pressed():
	get_tree().change_scene_to_file("res://Menu/ranking.tscn")
	
func _on_manual_pressed():
	get_tree().change_scene_to_file("res://Menu/manual.tscn")

func _on_return_pressed():
	get_tree().quit()



