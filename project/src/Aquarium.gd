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

func _ready():
	_update_HUD()

func _input(event):
		var MouseClickEvent : InputEventMouseButton = event as InputEventMouseButton
		if MouseClickEvent:
				_player.destination = event.position


func _on_FlakeDropTimer_timeout():
		var pos = _randint(100, 600)
		for x in range(0, _randint(flake_cluster_min,flake_cluster_max)): 
				if flakes_remaining > 0:
						flakes_remaining -= 1
						_update_HUD()
						var flake = FoodFlake.instance()
						flake.position = Vector2(pos - _randint(-flake_cluster_radius,flake_cluster_radius), _randint(-flake_cluster_radius,0))
						add_child(flake)
				_flake_drop_timer.start(rand_range(seconds_between_drops_min, seconds_between_drops_max))

func _update_HUD():
	_food_remaining_label.text = "Food Remaining: %d" % flakes_remaining

func _randint(minr, maxr):
		var value : int = int(round(rand_range(minr, maxr)))
		return value
