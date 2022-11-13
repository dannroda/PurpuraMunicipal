extends Node2D
var toca_izq = false
var toca_centro = false
var toca_der = false
var toca_externo = false
var falla = false
var score = 0
var contador = 0
var posiciones = []
onready var tema = get_parent().get_node("Cancion")
var tema_tiempo
func _ready():
#		$Nota.position.x = 500
	pass
onready var teclas_cancion := $Nota
func _process(delta):
	
	tema_tiempo = tema.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	if Input.is_action_just_pressed("ui_down"):
		teclas_cancion.position = Vector2(300,0)
		contador += 1
		add_child(teclas_cancion)
		
	if Input.is_action_just_pressed("ui_left"):
		posiciones.append([contador,teclas_cancion.position.x,tema_tiempo,ver_col()])
		print(contador, " : ",teclas_cancion.position.x," : ",tema_tiempo," : ",ver_col())
	if Input.is_action_just_pressed("ui_accept"):
		print(posiciones)
#	if teclas_cancion:
#		teclas_cancion.position.x -= 100 * delta
	if teclas_cancion.position.x > 0:
		teclas_cancion.position.x -= 200 * delta
	else:
		remove_child(teclas_cancion)
	if Input.is_action_just_pressed("ui_up"):
		ver_col()
func ver_col():
	falla = false
	if toca_externo == true:
		if toca_izq || toca_centro || toca_der:
			falla = false
			if toca_izq:
				score += 20
			if toca_centro:
				score += 50
			if toca_der:
				score += 30
			$Nota/Sprite.modulate = Color("#00FF00")
			print(toca_der)
			print(toca_centro)
			print(toca_izq)
		else:
			falla = true
			score -= 60
			$Nota/Sprite.modulate = Color("#FF0000")
			print("AFUEEERA")
	print(score)
	get_parent().get_node("ScoreText/ScoreValue").text = var2str(score)
	return falla
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
