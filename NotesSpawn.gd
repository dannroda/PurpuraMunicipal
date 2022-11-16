extends Node

func _ready():
	pass
func _input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
func _on_ButtonExit_pressed():
	get_tree().quit()
	


func _on_ButtonStart_pressed():
	if !$sonidito.playing:
		$sonidito.play()
	else:
		$sonidito.stop()
	get_tree().change_scene("res://Historia.tscn")
	

func _on_ButtonPlay_pressed():
	if !$sonidito.playing:
		$sonidito.play()
	else:
		$sonidito.stop()



func _on_bajarVolumen_pressed():
	AudioServer.set_bus_volume_db(0,AudioServer.get_bus_volume_db(0) - 1 )
	


func _on_ButtonStart_focus_entered():
	$Cartel.show()
	$menumov.play()
#	pass # Replace with function body.


func _on_ButtonStart_focus_exited():
	$Cartel.hide()
#	pass # Replace with function body.


func _on_Creditos_mouse_entered():
	$"creditos-text".show()
	$menumov.play()
#	pass # Replace with function body.


func _on_Creditos_mouse_exited():
	$"creditos-text".hide()
#	pass # Replace with function body.



func _on_ButtonExit_focus_entered():
	$menumov.play()
	pass # Replace with function body.


func _on_Intro_finished():
	$Intro.play()
#	pass # Replace with function body.
