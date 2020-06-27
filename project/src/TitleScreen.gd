extends Node2D

func _ready():
	Jukebox.play_title_music()


func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		OS.window_fullscreen = true
		var _error = get_tree().change_scene("res://src/Aquarium.tscn")
		queue_free()
