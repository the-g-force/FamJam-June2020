extends Area2D
class_name FoodFlake

export var fall_speed := 50

onready var CollisionShape2D := $CollisionShape2D
onready var sprite : AnimatedSprite = $AnimatedSprite

func _ready():
	randomize()
	var number = randi()%3
	if number == 1:
		sprite.play("Pink")
	elif number == 2:
		sprite.play("Green")
	elif number == 3:
		sprite.play("Purple")


func _process(delta):
	position += Vector2(0,fall_speed * delta)
