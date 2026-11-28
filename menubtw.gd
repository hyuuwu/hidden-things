extends Control


# Called when the node enters the scene tree for the first time.
#var skip = false
#func _ready() -> void:
	#if Autolod.init_data["skip_cutscen"] == 1:
		#skip = true
	#else:
		#pass


func _on_button_pressed() -> void:
	if Autolod.init_data.get("skip_cutscen", 0) == 1:
		get_tree().change_scene_to_file("res://maingame.tscn")
		print("ok")
	else:
		get_tree().change_scene_to_file("res://intro.tscn")
		print("not ok")
