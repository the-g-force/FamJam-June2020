extends Node2D

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		OS.window_fullscreen = true
		get_tree().change_scene("res://src/Aquarium.tscn")
		queue_free()
