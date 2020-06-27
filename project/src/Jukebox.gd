extends AudioStreamPlayer

const _title_music := preload("res://assets/title.ogg")
const _background_music := preload("res://assets/background.ogg")

func _ready():
	stream = _title_music
	play()
	
func play_background_music():
	stream = _background_music
	play()
