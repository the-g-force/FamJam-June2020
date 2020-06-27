extends KinematicBody2D

export var speed : float = 200.0

var destination : Vector2 = Vector2(500,500)
var should_move : bool = true

func _draw():
	var extents : Vector2 = $CollisionShape2D.shape.extents
	var r : Rect2 = Rect2(-extents.x, -extents.y, extents.x*2, extents.y*2)
	draw_rect(r, Color.red)
	draw_circle(Vector2(extents.x/2, 0), 5, Color.black)

func _process(delta):
	if should_move:
		var trajectory : Vector2 = destination - get_global_transform().origin
		var _velocity : Vector2 = trajectory.normalized() * delta * speed
		var _error = move_and_collide(_velocity)
		if (destination - get_global_transform().origin).length_squared() < 0.1:
			should_move = false
