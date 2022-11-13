extends Control

var cantidad = 5

# Called when th node enters the scene tree for the first time.
func _ready():
	pass
#	for cuadrado in cantidad:
#		spawn_cuadrado()
	
func _input(event):
	if event.is_action_pressed("ui_left"):
		$Primero.get_node("Sprite").modulate =  Color("#00FF00")
	elif event.is_action_released("ui_left"):
		$Primero.get_node("Sprite").modulate =  Color("#0000ff")
		

	if event.is_action_pressed("ui_right"):
		$Pimero2.get_node("Sprite").modulate =  Color("#FF0000")
	elif event.is_action_released("ui_right"):
		$Primero2.get_node("Sprite").modulate =  Color("#FFFF00")
	
	

#funac _process(delta):
#	spawn_cuadrado()
func spawn_cuadrado():
	var cuadrado = load("res://Boton.tscn").instance()
	cuadrado.position += Vector2(rand_range(0,750),0)
	add_child(cuadrado)
