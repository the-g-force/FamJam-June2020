extends Fish

const THRESHOLD := 3.0

export var speed : float = 200.0

var destination : Vector2 = Vector2(0,0) setget _set_destination
var _should_move : bool = false

func _process(delta):
	if _should_move:
		var trajectory : Vector2 = destination - get_global_transform().origin
		var _velocity : Vector2 = trajectory.normalized() * delta * speed
		var _error = move_and_collide(_velocity)
		if (destination - get_global_transform().origin).length_squared() < THRESHOLD:
			_should_move = false


func _set_destination(value):
	destination = value
	_should_move = true
