extends Node2D

func level_completed():
	print("level completed")
	


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
