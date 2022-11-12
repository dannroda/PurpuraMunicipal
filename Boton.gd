extends Node2D
var toca_izq = false
var toca_centro = false
var toca_der = false
var toca_externo = false
var falla = false
func _ready():
		$Nota.position.x = 500
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		$Nota.position.x = 500
	if $Nota.position.x > 0:
		$Nota.position.x -= 100 * delta
	if Input.is_action_just_pressed("ui_up"):
		if toca_externo == true:
			if toca_izq && toca_centro && toca_der:
				falla = false
				print(toca_der)
				print(toca_centro)
				print(toca_izq)
			else:
				falla = true
				print("AFUEEERA")



func _on_Nota_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.get_name() == "Fijo":
		if area_shape_index == 2:
			print("Entro a la derecha")
			toca_der = true
		elif area_shape_index == 1:
			print("Esta en el centro")
			toca_centro = true
		elif area_shape_index == 0:
			print("esta en la izquierda")
			toca_izq = true
	elif area.get_name() == "Externo":
		print("externo")
		toca_externo = true

	elif area.get_name() == "Externo":
		print("externo")
		toca_externo = true
func _on_Nota_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.get_name() == "Fijo":
		if area_shape_index == 2:
			print("Sale a la derecha")
			toca_der = false
		elif area_shape_index == 1:
			print("Sale en el centro")
			toca_centro = false
		elif area_shape_index == 0:
			print("Sale en la izquierda")
			toca_izq = false
	elif area.get_name() == "Externo":
		print("sale externo")
		toca_externo = false
