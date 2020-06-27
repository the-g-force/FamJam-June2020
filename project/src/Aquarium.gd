extends Node2D

var pointclicked : Vector2 = Vector2(0,0)

onready var fish := $Fish

func _process(_delta):
	if Input.is_action_just_pressed("clicked"):
		pointclicked = get_global_mouse_position()
		if pointclicked < get_viewport_rect().size:
			fish.destination = pointclicked
