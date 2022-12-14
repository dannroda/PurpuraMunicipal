extends Area2D
export var nota_scene: PackedScene
export var speed:float = 150.0
export var falla:bool = false
export var pos_flecha:String 
export var teclas = ['ui_up','ui_down','ui_left','ui_right']
export var rand_index:int = randi() % teclas.size()
onready var sonido_error := $wrong
export var acierto:bool = false
func _ready():
#	$Sprite.texture = load("res://sprites/partitura/flecha animacion.png")
	pos_flecha = teclas[rand_index]
	
func _process(delta):
		var arr = get_overlapping_areas()
		var velocity = Vector2.LEFT * speed
		var tecla_fail = false
#		_check_pos_rot()
		if pos_flecha == 'ui_right':
			rotation_degrees = 90
		if pos_flecha == 'ui_left':
			rotation_degrees = 270
		if pos_flecha == 'ui_up':
			rotation_degrees = 0
		if pos_flecha == 'ui_down':
			rotation_degrees = 180
		position += velocity * delta
		if position.x < 0:
			queue_free()
#			get_parent().vidas -= 1
		
#		if acierto == true:
#			print("TEXTO")
#			if Input.is_action_just_pressed(pos_flecha):
#				tecla_fail = get_parent().ver_col()
#				print("POSICION ", pos_flecha)
#				print(tecla_fail)
#				queue_free()
#			acierto = false
func _input(event):
	if event is InputEventKey and event.pressed:
		acierto = true
		print(event.is_action(pos_flecha))
		if event.is_action(pos_flecha) && acierto:
#			print(pos_flecha)
#			print(get_parent().acierto)
			acierto = get_parent().ver_col()
#			queue_free()
		acierto = false

#		print(acierto)
#			get_parent().get_node("sonidofail").play()
#			print("ES ARRIBA")

#		if tecla_fail != false:
#			$wrong.play()
#			tecla_fail = false
			
#		if position.x < -20:
#			queue_free()
#		print(position)
func sane_input(tecla):
	if tecla == 'ui_up':
		return KEY_UP
	if tecla == 'ui_down':
		return KEY_DOWN
	if tecla == 'ui_left':
		return KEY_LEFT
	if tecla == 'ui_right':
		return KEY_RIGHT
		
	
	
func _check_pos_rot():
		if Input.is_action_just_pressed("ui_up"):
			pos_flecha = 'ui_up'
		if Input.is_action_just_pressed("ui_down"):
			pos_flecha = 'ui_down'
		if Input.is_action_just_pressed("ui_left"):
			pos_flecha = 'ui_left'
		if Input.is_action_just_pressed("ui_right"):
			pos_flecha = 'ui_right'
