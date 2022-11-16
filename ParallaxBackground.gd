extends ParallaxBackground

var rng = RandomNumberGenerator.new()
var timer = Timer.new()
#var DIR = Vector2(1, 1)
#var speed = 100
#
#func _physics_process(delta):
#	scroll_base_offset += DIR * speed * delta
onready var layer1 = $layer1
onready var musico1 = $musico1
onready var musico2 = $musico2
onready var musico3 = $musico3
onready var musico4 = $musico4
onready var gente = $gente
onready var gente2 = $gente2

var vel = 50

func _ready():
#	opacidad_luces(0.4)
	timer.connect("timeout",self,"timers")
	timer.wait_time = 0.5
	add_child(timer)
	timer.start()
func opacidad_luces(valor):
	$layer1/RojaDerecha.modulate.a = valor
	$layer1/RojaIzquierda.modulate.a = valor
	$layer1/VioletaDerecha.modulate.a = valor
	$layer1/VioletaIzquierda.modulate.a = valor
	$layer1/VerdeDerecha.modulate.a = valor
	$layer1/VerdeIzquierda.modulate.a = valor

#func _input(event):
#	if event is InputEventMouseMotion:
#		moverLayer(event, layer1, vel/5)
#		moverLayer(event, musico1, vel*0.7)
#		moverLayer(event, musico2, vel)
#		moverLayer(event, musico3, vel*0.5)
#		moverLayer(event, musico4, vel*1.3)
#		moverLayer(event, gente, vel*2.5)
#		moverLayer(event, gente2, vel*5)
#

func moverLayer(x,y, obj, vel):
#	var mouse_x = event.position.x
#	var mouse_y = event.position.y
	var mouse_x = x
	var mouse_y = y
	var viewport_size=get_viewport().size
	var relative_x = (mouse_x - (viewport_size.x/2)) / (viewport_size.x/2)
	var relative_y = (mouse_y - (viewport_size.y/2)) / (viewport_size.y/2)
	obj.motion_offset.x = vel * -relative_x
	obj.motion_offset.y = vel * -relative_y
func _process(delta):
	pass
#func mover_todo():

#	moverLayer(rand_index,rand_index, layer1, vel/5)
#	moverLayer(rand_index,rand_index, musico1, vel*0.7)
#	moverLayer(rand_index,rand_index, musico2, vel)
#	moverLayer(rand_index,rand_index, musico3, vel*0.5)
#	moverLayer(rand_index,rand_index, musico4, vel*1.3)
#	moverLayer(rand_index,rand_index, gente, vel*2.5)
#	moverLayer(rand_index,rand_index, gente2, vel*5)
		
#	print(rand_index) 
func esconder_mostrar(elemento):
#	print(luces.randi_range(0,40))
	if rng.randi_range(0,40) < 20:
		elemento.show()
	else:
		elemento.hide()

func esconder_mostrar_pj():
	var control = rng.randi_range(0,100)
	if get_parent().get_node("CanvasLayer") != null:
		if  0 < control && control < 25:
			get_parent().get_node("CanvasLayer/Baterista").show()
			get_parent().get_node("CanvasLayer/Bajista").hide()
			get_parent().get_node("CanvasLayer/Guitarra").hide()
			get_parent().get_node("CanvasLayer/Tecladista").hide()
		elif 25 < control  && control < 50:
			get_parent().get_node("CanvasLayer/Bajista").show()
			get_parent().get_node("CanvasLayer/Baterista").hide()
			get_parent().get_node("CanvasLayer/Guitarra").hide()
			get_parent().get_node("CanvasLayer/Tecladista").hide()
		elif 50 < control  && control < 75:
			get_parent().get_node("CanvasLayer/Guitarra").show()
			get_parent().get_node("CanvasLayer/Bajista").hide()
			get_parent().get_node("CanvasLayer/Baterista").hide()
			get_parent().get_node("CanvasLayer/Tecladista").hide()
		else:
			get_parent().get_node("CanvasLayer/Tecladista").show()
			get_parent().get_node("CanvasLayer/Bajista").hide()
			get_parent().get_node("CanvasLayer/Baterista").hide()
			get_parent().get_node("CanvasLayer/Guitarra").hide()
	
		
func luces_todas():
	esconder_mostrar($layer1/RojaDerecha)
	esconder_mostrar($layer1/RojaIzquierda)
	esconder_mostrar($layer1/VioletaDerecha)
	esconder_mostrar($layer1/VioletaIzquierda)
	esconder_mostrar($layer1/VerdeDerecha)
	esconder_mostrar($layer1/VerdeIzquierda)

func timers():
	luces_todas()
	esconder_mostrar_pj()


func _on_Timer_timeout():
	var rand_index = rng.randi_range(940,65)
	gente.position.y = rand_index
	gente2.position.y = rand_index
	print(gente.position.y)
