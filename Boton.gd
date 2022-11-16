extends Node2D
var toca_izq = false
var toca_centro = false
var toca_der = false
var toca_externo = false
var falla = false
var score = 0
var contador = 0
var posiciones = []
var cambia = false
var indice_tecla = 'ui_up'
var pos_temp = [[0, 0, 1.047336, false], [0, 0, 1.602949, true], [0, 0, 2.26095, true], [0, 0, 2.922898, true], [0, 0, 3.563536, true], [0, 0, 4.228465, true], [0, 0, 5.604276, true], [0, 0, 6.280767, true], [0, 0, 6.961991, true], [0, 0, 7.657013, true], [0, 0, 8.31276, true], [0, 0, 8.960431, true], [0, 0, 9.638799, true], [0, 0, 10.338718, true], [0, 0, 11.034159, true], [0, 0, 11.745742, true], [0, 0, 12.068911, true], [0, 0, 12.42857, true], [0, 0, 12.744987, true], [0, 0, 13.177021, true], [0, 0, 13.854014, true], [0, 0, 14.586912, true]]
onready var tema = get_parent().get_node("Cancion")
onready var partitura = get_parent().get_node("partitura")
export var acierto:bool
var combo:int = 0
var tema_tiempo
var timer = Timer.new()
export var vidas:int = 3
func _ready():
	partitura.modulate.a = 0.4
	timer.connect("timeout",self,"tempo")
	timer.wait_time = 0.9
	add_child(timer)
	timer.start()
	$Nota.queue_free()
onready var nodo_teclas = preload("res://Notas.tscn")
func tempo():
	var teclas_cancion = nodo_teclas.instance()	
	teclas_cancion.position = Vector2(500,0)
	contador += 1
	indice_tecla = teclas_cancion.rand_index
	teclas_cancion.pos_flecha = teclas_cancion.teclas[indice_tecla]
	$Fijo.pos_flecha = teclas_cancion.pos_flecha
	add_child(teclas_cancion)
func _process(delta):
	
	tema_tiempo = tema.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	get_parent().get_node("TiempoCancion").text = var2str(tema_tiempo)
	if tema_tiempo - tema.stream.get_length() >= -0.02:
		get_tree().change_scene("res://Win.tscn")
	if vidas <= 0:
		get_tree().change_scene("res://Gameover.tscn")
#	print(tema_tiempo - tema.stream.get_length())
#	var teclas_cancion = nodo_teclas.instance()
#	if contador < pos_temp.size():
#		get_parent().get_node("TiempoCancion/TiempoArr").text = var2str(tema.stream.get_length())
#		if tema_tiempo - pos_temp[contador][2] > 0: 
##			print(pos_temp[contador][2])
##			print(tema_tiempo)
#			teclas_cancion.position = Vector2(300,0)
#			contador += 1
#			indice_tecla = teclas_cancion.rand_index
#			teclas_cancion.pos_flecha = teclas_cancion.teclas[indice_tecla]
#			$Fijo.pos_flecha = teclas_cancion.pos_flecha
#			add_child(teclas_cancion)
#
#	if Input.is_action_just_pressed("ui_page_down"):
#		contador += 1
#		indice_tecla = teclas_cancion.rand_index
#		teclas_cancion.pos_flecha = teclas_cancion.teclas[indice_tecla]
#		$Fijo.pos_flecha = teclas_cancion.pos_flecha
#		add_child(teclas_cancion)
#		teclas_cancion.position.x = 300
#
#	if teclas_cancion.position.x == 0:
#		teclas_cancion.queue_free()
#	if Input.is_action_just_pressed("entrada"):
#		posiciones.append([contador,teclas_cancion.position.x,tema_tiempo,ver_col()])
#		print(contador, " : ",teclas_cancion.position.x," : ",tema_tiempo," : ",ver_col(teclas_cancion))
		
#	if Input.is_action_just_pressed("ui_cancel"):
#		print(posiciones)
#	if teclas_cancion:
#		teclas_cancion.position.x -= 100 * delta
#	if Input.is_action_pressed("ui_accept"):
#		ver_col(teclas_cancion)
#		remove_child(teclas_cancion)
#		remove_child(teclas_cancion)
#		print("teclas ",teclas_cancion)

func ver_col():
	var tocada = false
	falla = false
	if toca_externo == true:
		tocada = true
		if toca_izq || toca_centro || toca_der:
			combo += 1
			falla = false
			if toca_izq:
				score += 20 
			if toca_centro:
				score += 50
			if toca_der:
				score += 30
			acierto = true
		else:
			falla = true
			score -= 60
			combo = 0
			$sonidofail.play()
			print("AFUEEERA")
	if falla == false:
		get_parent().get_node("cuadrado").modulate = Color("#00ff00")
	else:
		vidas -= 1
		get_parent().get_node("cuadrado").modulate = Color("#ffffff")
		print("vidas ", vidas)
		falla = false
	if tocada:
		get_parent().get_node("ScoreText/ScoreValue").text = var2str(score)
		get_parent().get_node("Combo/ComboValue").text = var2str(combo)
		get_parent().get_node("VidasText/VidasCount").text = var2str(vidas)
		print('score ',score)
		print('combo ', combo)
	tocada = false
	return falla
func _input(event):
	if event is InputEventKey and !event.pressed:
		get_parent().get_node("cuadrado").modulate = Color("#ffffff")
func _on_Nota_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
#	print("Entered ",area.get_name(), " ", area_shape_index, " ", local_shape_index)
#	if area.get_name() == "Fijo":
#		print('tests ',area_shape_index)
#		print('testss ',local_shape_index)
	if local_shape_index == 2:
#		print("Entro a la derecha")
		toca_der = true
	elif local_shape_index == 1:
#		print("Esta en el centro")
		toca_centro = true
	elif local_shape_index == 0:
#		print("esta en la izquierda")
		toca_izq = true
#	elif area.get_name() == "Externo":
#		print("externo")
	toca_externo = true

#	elif area.get_name() == "Externo":
#		print("externo")
#		toca_externo = true
func _on_Nota_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
#	print("Exited ",area.get_name(), " ", area_shape_index, " ", local_shape_index)
#	print('testx ',area_shape_index)
#	print('testxx ',local_shape_index)
#	if area.get_name() == "Fijo":
	if local_shape_index == 2:
#		print("Sale a la derecha")
		toca_der = false
	elif local_shape_index == 1:
#		print("Sale en el centro")
		toca_centro = false
	elif local_shape_index == 0:
#		print("Sale en la izquierda")
		toca_izq = false
#	elif area.get_name() == "Externo":
#		print("sale externo")
#		toca_externo = false
