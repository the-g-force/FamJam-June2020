extends Node2D

var MainScene := preload("res://src/Aquarium.tscn")

func _input(event):
	if event is InputEventMouseButton:
		get_tree().get_root().add_child(MainScene.instance())
		queue_free()
