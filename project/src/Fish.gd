extends KinematicBody2D
class_name Fish

signal reached_destination
signal ate_flake

const THRESHOLD := 3.0

export var speed : float = 200

var destination : Vector2 = Vector2(0,0) setget _set_destination
var _should_move : bool = false

onready var _blub_sound : AudioStreamPlayer = $AudioStreamPlayer2D


func _process(_delta):
	if _should_move:
		var direction = destination - get_global_transform().origin
		var velocity = direction.normalized() * speed
		$Sprite.scale.x = 1 if velocity.x > 0 else -1
		var _error = move_and_slide(velocity)
		if (get_global_transform().origin - destination).length_squared() < THRESHOLD:
			_should_move = false
			emit_signal("reached_destination")
	
	
func _set_destination(value):
	destination = value
	_should_move = true


func _on_Mouth_area_entered(area):
	if area is FoodFlake:
		_blub_sound.play()
		area.call_deferred("queue_free")
		emit_signal("ate_flake")

