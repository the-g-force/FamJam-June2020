extends Fish

export var min_x := 20
export var max_x := 700

func _ready():
	_set_destination(Vector2(max_x, get_global_transform().origin.y))
	speed = 100


func _on_Area2D_area_entered(area):
	if area is FoodFlake:
		target = area


func _on_reached_destination():
	_set_destination(Vector2(min_x if destination.x == max_x else max_x, destination.y))


func _on_ate_flake():
	var thingie = randint(0,1)
	_set_destination(Vector2(min_x if thingie == 0 else max_x, get_global_transform().origin.y))
	target = null


func randint(minr, maxr):
	var value : int = int(round(rand_range(minr, maxr)))
	return value
