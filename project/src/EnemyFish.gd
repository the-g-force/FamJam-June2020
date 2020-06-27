extends Fish

export var min_x := 20
export var max_x := 500

var target = null

func _ready():
	_set_destination(Vector2(max_x, get_global_transform().origin.y))


func _on_Area2D_area_entered(area):
	if area is FoodFlake:
		target = area


func _on_Mouth_area_entered(area):
	pass


func _on_reached_destination():
	print('reached destination')
	_set_destination(Vector2(min_x if destination.x == max_x else max_x, destination.y))
	print('new destination is ', destination)
