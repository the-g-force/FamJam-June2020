extends Fish

export var min_x := 20
export var max_x := 500
export var speed := 100.0

var _direction := Vector2(1,0)

func _process(delta):
	var _error = move_and_collide(_direction * speed * delta)
	if get_global_transform().origin.x >= max_x:
		_direction = Vector2(-1,0)
	if get_global_transform().origin.x <= min_x:
		_direction = Vector2(1,0)
