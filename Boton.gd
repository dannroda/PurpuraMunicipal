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
var pos_temp = [[0, 155.233353, 1.664935, false], [0, 18.532949, 2.337623, true], [0, -1.467053, 2.770102, false], [0, -1.467053, 3.176262, false], [0, -1.467053, 3.570058, false], [0, -1.467053, 6.436137, false], [0, -1.467053, 6.769875, false], [0, -1.467053, 7.182365, false], [0, -1.467053, 7.448249, false], [0, -1.467053, 7.806699, false], [0, -1.467053, 8.409382, false], [0, -1.467053, 8.588416, false], [0, -1.467053, 8.94289, false], [0, -1.467053, 9.401746, false], [0, -1.467053, 10.027719, false], [0, -1.467053, 10.367209, false], [0, -1.467053, 10.775926, false], [0, -1.467053, 11.169923, false], [0, -1.467053, 11.685657, false], [0, -1.467053, 12.16355, false], [14, 273.333252, 12.734209, false], [14, 166.666672, 13.268846, false], [14, 70.000015, 13.749817, true], [14, -3.333313, 14.174942, false], [14, -3.333313, 14.602454, false], [14, -3.333313, 15.064106, false], [14, -3.333313, 15.453845, false], [14, -3.333313, 15.957266, false], [14, -3.333313, 16.381637, false], [14, -3.333313, 17.201423, false], [14, -3.333313, 17.644034, false], [14, -3.333313, 18.0202, false]]
onready var tema = get_parent().get_node("Cancion")
onready var partitura = get_parent().get_node("partitura")


var tema_tiempo
func _ready():
	partitura.modulate.a = 0.4
onready var nodo_teclas = preload("res://Notas.tscn")

func _process(delta):
	
	tema_tiempo = tema.get_playback_position() + AudioServer.get_time_since_last_mix()
	get_parent().get_node("TiempoCancion").text = var2str(tema_tiempo)
	
	var teclas = ['ui_up','ui_down','ui_left','ui_right']
	var rand_index:int = randi() % teclas.size()
	var teclas_cancion = nodo_teclas.instance()
	if contador <= pos_temp.size():
#		print("tiempo: ", tema_tiempo)
#		print("tiempo_arr: ", pos_temp[contador -1][2])
#		print("resta: ",tema_tiempo - pos_temp[contador - 1][2] > 0)
		get_parent().get_node("TiempoCancion/TiempoArr").text = var2str(pos_temp[contador -1][2])
		if tema_tiempo - pos_temp[contador - 1][2] > 0: 
#			print(pos_temp[contador -1][2])
#			print(tema_tiempo)
			teclas_cancion.position = Vector2(300,0)
			contador += 1
			
			
#			add_child(teclas_cancion)



#		print(teclas[rand_index])
		if Input.is_action_just_pressed(teclas[rand_index]):
			print(teclas[rand_index])
			if teclas[rand_index] == 'ui_up':
				teclas_cancion.texture = load("res://sprites/Personajes/chobi1.png")
			add_child(teclas_cancion)
		if Input.is_action_just_pressed('ui_up'):
			teclas_cancion.texture = load("res://sprites/Personajes/chobi1.png")
	if Input.is_action_just_pressed("ui_page_down"):
		contador += 1
		add_child(teclas_cancion)
		teclas_cancion.position.x = 300
	
	if teclas_cancion.position.x > 0:
		teclas_cancion.position.x -= 200 * delta
		print(teclas_cancion.position.x)
	elif teclas_cancion:
		teclas_cancion.queue_free()
		
	if Input.is_action_just_pressed("ui_page_up"):
		posiciones.append([contador,teclas_cancion.position.x,tema_tiempo,ver_col(teclas_cancion)])
#		print(contador, " : ",teclas_cancion.position.x," : ",tema_tiempo," : ",ver_col(teclas_cancion))
		
	if Input.is_action_just_pressed("ui_cancel"):
		print(posiciones)
#	if teclas_cancion:
#		teclas_cancion.position.x -= 100 * delta
	if Input.is_action_pressed("ui_accept"):
		ver_col(teclas_cancion)
#		remove_child(teclas_cancion)
#		remove_child(teclas_cancion)
#		print("teclas ",teclas_cancion)
func ver_col(node):
	var tocada = false
	falla = false
	if toca_externo == true:
		tocada = true
		if toca_izq || toca_centro || toca_der:
			falla = false
			if toca_izq:
				score += 20 
			if toca_centro:
				score += 50
			if toca_der:
				score += 30
			node.modulate = Color("#00FF00")
			print(node)
#			print(toca_der)
#			print(toca_centro)
#			print(toca_izq)
		else:
			falla = true
			score -= 60
			node.modulate = Color("#FF0000")
			$Nota/wrong.play()
			print("AFUEEERA")
	if tocada:
		get_parent().get_node("ScoreText/ScoreValue").text = var2str(score)
		print('score ',score)
	tocada = false
	return falla
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
