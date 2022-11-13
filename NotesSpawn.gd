extends Node

func _ready():
	pass

func _on_ButtonExit_pressed():
	get_tree().quit()
	


func _on_ButtonStart_pressed():
	if !$sonidito.playing:
		$sonidito.play()
	else:
		$sonidito.stop()
	get_tree().change_scene("res://Control.tscn")
	

func _on_ButtonPlay_pressed():
	if !$sonidito.playing:
		$sonidito.play()
	else:
		$sonidito.stop()



func _on_bajarVolumen_pressed():
	AudioServer.set_bus_volume_db(0,AudioServer.get_bus_volume_db(0) - 1 )
	
