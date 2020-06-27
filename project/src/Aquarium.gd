extends Node2D

var pointclicked : Vector2 = Vector2(0,0)
var foodflake : PackedScene = preload("res://src/FoodFlake.tscn")
var flakesleft : int = 100

onready var player := $PlayerFish

func _process(_delta):
	if Input.is_action_just_pressed("clicked"):
		pointclicked = get_global_mouse_position()
		if pointclicked < get_viewport_rect().size:
			player.destination = pointclicked


func _on_Timer_timeout():
	var pos = randint(100, 600)
	for x in range(0, randint(3,6)):
		if flakesleft > 0:
			var Foodflake = foodflake.instance()
			Foodflake.position = Vector2(pos-randint(-50,50), 0)
			add_child(Foodflake)
			yield(get_tree().create_timer(rand_range(0.5,1)), 'timeout')


func randint(minr, maxr):
	var value : int = int(round(rand_range(minr, maxr)))
	return value
