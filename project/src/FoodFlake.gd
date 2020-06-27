extends KinematicBody2D
class_name FoodFlake

export var fall_speed := 50

onready var CollisionShape2D := $CollisionShape2D

func _process(delta):
	position += Vector2(0,fall_speed * delta)

func _draw():
	draw_circle(Vector2.ZERO, CollisionShape2D.shape.radius, Color.beige)
