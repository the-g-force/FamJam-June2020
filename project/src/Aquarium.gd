extends Node2D

const FoodFlake := preload("res://src/FoodFlake.tscn")

export var flakes_remaining := 100
export var flake_cluster_min := 3
export var flake_cluster_max := 6
export var flake_cluster_radius := 50
export var seconds_between_drops_min : float = 1
export var seconds_between_drops_max : float = 3

onready var _player := $PlayerFish
onready var _flake_drop_timer := $FlakeDropTimer
onready var _food_remaining_label : Label = $FoodRemaining
onready var _points_label : Label = $Points
onready var _flakes : Node = $Flakes
onready var _shaker_sound : AudioStreamPlayer = $ShakerSound
onready var _endmessage : Label = $EndGameMessage
onready var _animation : AnimationPlayer = $AnimationPlayer

var points : int = 0
var game_over : bool = false

func _ready():
	Jukebox.play_background_music()
	_update_HUD()


func _process(_delta):
	if flakes_remaining == 0 and _flakes.get_child_count() == 0 and not game_over:
		_animation.play("EndGame")


func _input(event):
		var MouseClickEvent : InputEventMouseButton = event as InputEventMouseButton
		if MouseClickEvent && event.is_pressed():
			if game_over == false:
				_player.destination = event.position
			else:
				var _error = get_tree().change_scene("res://src/TitleScreen.tscn")


func _on_FlakeDropTimer_timeout():
	_shaker_sound.play()
	var pos = _randint(100, 600)
	for _x in range(0, _randint(flake_cluster_min,flake_cluster_max)): 
			if flakes_remaining > 0:
					flakes_remaining -= 1
					_update_HUD()
					var flake = FoodFlake.instance()
					flake.position = Vector2(pos - _randint(-flake_cluster_radius,flake_cluster_radius), _randint(-flake_cluster_radius,0))
					_flakes.add_child(flake)
	if flakes_remaining > 0:
		_flake_drop_timer.start(rand_range(seconds_between_drops_min, seconds_between_drops_max))


func _update_HUD():
	_food_remaining_label.text = "Food Remaining: %d" % flakes_remaining
	_points_label.text = "Food Eaten: %d" % points


func _randint(minr, maxr):
	randomize()
	var value : int = int(round(rand_range(minr, maxr)))
	return value


func _on_PlayerFish_point():
	points += 1
	_update_HUD()


func _on_Trash_area_entered(area):
	area.call_deferred("queue_free")


func _on_animation_finished(_anim_name):
	game_over = true


