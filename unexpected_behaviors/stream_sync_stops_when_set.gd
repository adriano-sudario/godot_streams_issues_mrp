extends Control

var is_guitarrinha1 := true
var guitarrinha1 := load("res://sounds/guitarrinha1.mp3")
var guitarrinha2 := load("res://sounds/guitarrinha2.mp3")
var is_null := false

@onready var audio_player = $AudioPlayer
@onready var playback_position_label = $PlaybackPositionLabel

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		if audio_player.playing:
			audio_player.stop()
		else:
			audio_player.play()
	
	if Input.is_action_just_pressed("1"):
		toggle_guitarrinha()
	
	if Input.is_action_just_pressed("2"):
		toggle_null()
	
	playback_position_label.text = "playback position: %0.2f" % audio_player.get_playback_position()

func toggle_null():
	is_null = not is_null
	
	if is_null:
		audio_player.stream.set_sync_stream(3, null)
	elif is_guitarrinha1:
		audio_player.stream.set_sync_stream(3, guitarrinha1)
	else:
		audio_player.stream.set_sync_stream(3, guitarrinha2)

func toggle_guitarrinha():
	if is_guitarrinha1:
		audio_player.stream.set_sync_stream(3, guitarrinha2)
		is_guitarrinha1 = false
	else:
		audio_player.stream.set_sync_stream(3, guitarrinha1)
		is_guitarrinha1 = true
