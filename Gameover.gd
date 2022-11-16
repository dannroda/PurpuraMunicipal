extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var tema_tiempo = $gameover.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	if tema_tiempo - $gameover.stream.get_length() >= -0.02:
		get_tree().change_scene("res://Menu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
