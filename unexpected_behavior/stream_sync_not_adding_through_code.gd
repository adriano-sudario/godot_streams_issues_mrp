extends Control

var loaded_method = ""
var core_kit := load("res://sounds/707_core_kit.mp3")
var canadina_boards := load("res://sounds/canadian_boards.mp3")
var suburban := load("res://sounds/suburban.mp3")
var guitarrinha1 := load("res://sounds/guitarrinha1.mp3")
var guitarrinha2 := load("res://sounds/guitarrinha2.mp3")

@onready var audio_player = $AudioPlayer
@onready var info_label = $InfoLabel

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		if audio_player.playing:
			audio_player.stop()
		else:
			audio_player.play()
	
	if Input.is_action_just_pressed("1"):
		load_streams()
	
	if Input.is_action_just_pressed("2"):
		load_streams_with_work_around()
	
	if Input.is_action_just_pressed("3"):
		load_streams_with_proposal()
	
	info_label.text = "playback position: %0.2f\n%s"\
		% [audio_player.get_playback_position(), get_loaded_method_description()]

func get_loaded_method_description():
	if loaded_method == "":
		return "not loaded"
	
	if loaded_method == "1":
		return "loaded with method 1 (wont work unless method 2 has been called)"
	
	if loaded_method == "2":
		return "loaded with method 2 (will work)"
	
	if loaded_method == "3":
		return "loaded with method 3"

func load_streams():
	var audio_player_stream: AudioStreamSynchronized = audio_player.stream
	audio_player_stream.set_sync_stream(0, core_kit)
	audio_player_stream.set_sync_stream(1, canadina_boards)
	audio_player_stream.set_sync_stream(2, suburban)
	audio_player_stream.set_sync_stream(3, guitarrinha1)
	audio_player_stream.set_sync_stream(4, guitarrinha2)
	loaded_method = "1"

func load_streams_with_work_around():
	var audio_player_stream: AudioStreamSynchronized = audio_player.stream
	audio_player_stream.stream_count = 5
	audio_player_stream.set_sync_stream(0, core_kit)
	audio_player_stream.set_sync_stream(1, canadina_boards)
	audio_player_stream.set_sync_stream(2, suburban)
	audio_player_stream.set_sync_stream(3, guitarrinha1)
	audio_player_stream.set_sync_stream(4, guitarrinha2)
	loaded_method = "2"

func load_streams_with_proposal():
	var audio_player_stream = audio_player.stream
	audio_player_stream.add_sync_stream(core_kit)
	audio_player_stream.add_sync_stream(canadina_boards)
	audio_player_stream.add_sync_stream(suburban)
	audio_player_stream.add_sync_stream(guitarrinha1)
	audio_player_stream.add_sync_stream(guitarrinha2)
	loaded_method = "3"
