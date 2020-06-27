extends Control


func _input(event):
	if event is InputEventMouseButton:
		OS.window_fullscreen = true
		get_tree().change_scene("res://src/TitleScreen.tscn")
		queue_free()
