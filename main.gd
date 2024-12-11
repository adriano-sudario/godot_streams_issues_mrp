extends Control


func _on_issue_one_button_pressed():
	get_tree().change_scene_to_file("res://bugs/interactive_stream_get_playback_position_returns_always_zero.tscn")

func _on_issue_two_button_pressed():
	get_tree().change_scene_to_file("res://bugs/stream_sync_play_not_setting_position_right_sometimes.tscn")

func _on_proposal_one_button_pressed():
	get_tree().change_scene_to_file("res://unexpected_behaviors/stream_sync_not_adding_through_code.tscn")
	
func _on_proposal_two_button_pressed():
	get_tree().change_scene_to_file("res://unexpected_behaviors/stream_sync_stops_when_set.tscn")
