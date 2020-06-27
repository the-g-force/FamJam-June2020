extends KinematicBody2D
class_name Fish

func _draw():
	var extents : Vector2 = $CollisionShape2D.shape.extents
	var r : Rect2 = Rect2(-extents.x, -extents.y, extents.x*2, extents.y*2)
	draw_rect(r, Color.red)
	draw_circle(Vector2(extents.x/2, 0), 5, Color.black)
