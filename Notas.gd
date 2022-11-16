extends Area2D
export var nota_scene: PackedScene
export var speed:float = 200.0
export var falla:bool = false
func _ready():
	pass
	
func _process(delta):
		var arr = get_overlapping_areas()
		var velocity = Vector2.LEFT * speed
		position += velocity * delta
#		if arr != []:
#			print("arr ", arr.size())
#		print(get_index())
#		if get_index() == 2:
#			print('ACTIVADO')
#		print(get_index())
