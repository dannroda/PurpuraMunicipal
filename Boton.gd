extends Node2D
var toca_izq = false
var toca_centro = false
var toca_der = false
var toca_externo = false
var falla = false
var elemento = "GGH"
var posiciones = []
onready var tema = get_parent().get_node("Cancion")
func _ready():
		$Nota.position.x = 500
var teclas_cancion = load("res://Notas.tscn").instance()
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		teclas_cancion.position = Vector2(500,0)
		add_child(teclas_cancion)
	if Input.is_action_just_pressed("ui_left"):
		posiciones.append([teclas_cancion.position.x,tema.get_playback_position()])
	if Input.is_action_just_pressed("ui_accept"):
		print(posiciones)
	if teclas_cancion.position.x == -30:
		remove_child(teclas_cancion)
	if teclas_cancion:
		teclas_cancion.position.x -= 100 * delta
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
