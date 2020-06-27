extends Fish

export var min_x := 90
export var max_x := 700

var _target

func _ready():
	_set_destination(Vector2(max_x, get_global_transform().origin.y))


func _process(_delta):
	if _target and weakref(_target).get_ref():
		_set_destination(_target.get_global_transform().origin)


func _on_Area2D_area_entered(area):
	if area is FoodFlake:
		_target = area


func _on_reached_destination():
	_set_destination(Vector2(min_x if destination.x == max_x else max_x, destination.y))


func _on_ate_flake():
	randomize()
	_set_destination(Vector2(min_x if randi()%2 == 1 else max_x, get_global_transform().origin.y))
	_target = null

