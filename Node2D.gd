extends Node

var actionName = "move_right"
var elemento = "url del elemento"
var posiciones = []

func _input(event):
	if event.is_action_pressed(actionName):
		posiciones.append_array(elemento.get_pos())
