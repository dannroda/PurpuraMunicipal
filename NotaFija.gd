extends Area2D
#export var nota_scene: PackedScene
#export var speed:float = 200.0
export var arr_fijo = []
func _ready():
	pass
	
func _process(delta):
		arr_fijo = get_overlapping_areas()
#		var velocity = Vector2.LEFT * speed
#		position += velocity * delta
#	if arr != []:
#		print("el array es", arr)
