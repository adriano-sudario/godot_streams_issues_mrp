extends Control

@onready var audio_player = $AudioPlayer
@onready var playback_position_label = $PlaybackPositionLabel

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		if audio_player.playing:
			audio_player.stop()
		else:
			if Input.is_key_pressed(KEY_SHIFT):
				audio_player.play(41)
			else:
				audio_player.play()
	
	if Input.is_action_just_pressed("1"):
		audio_player.play(audio_player.get_playback_position())
	
	playback_position_label.text = "playback position: %0.2f" % audio_player.get_playback_position()
