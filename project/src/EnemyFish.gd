extends Fish

export var min_x := 20
export var max_x := 500
export var speed := 100.0

var target = null
var _direction := Vector2(1,0)

func _process(delta):
	if target == null:
		if get_global_transform().origin.x >= max_x:
			_direction = Vector2(-1,0)
		if get_global_transform().origin.x <= min_x:
			_direction = Vector2(1,0)
	else:
		_direction = target.get_global_transform().origin - get_global_transform().origin
	var _error = move_and_collide(_direction.normalized()*speed*delta)


func _on_Area2D_body_entered(body):
	if body is FoodFlake:
		print("Yay")
		target = body
