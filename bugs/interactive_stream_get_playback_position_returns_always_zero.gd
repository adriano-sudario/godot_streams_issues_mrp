extends Control

@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var playback_position_label = $PlaybackPositionLabel

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		if audio_player.playing:
			audio_player.stop()
		else:
			audio_player.play()
	
	if Input.is_action_just_pressed("1"):
		audio_player.get_stream_playback().switch_to_clip_by_name("1")
	
	if Input.is_action_just_pressed("2"):
		audio_player.get_stream_playback().switch_to_clip_by_name("2")
	
	if Input.is_action_just_pressed("3"):
		audio_player.get_stream_playback().switch_to_clip_by_name("3")
	
	playback_position_label.text = "playback position: %0.2f" % audio_player.get_playback_position()
