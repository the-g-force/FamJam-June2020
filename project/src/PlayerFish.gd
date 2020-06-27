extends Fish

signal point

func _on_PlayerFish_ate_flake():
	emit_signal("point")
