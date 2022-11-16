extends Area2D
#export var nota_scene: PackedScene
#export var speed:float = 200.0
export var arr_fijo = []
export var pos_flecha:String = 'ui_up'
func _ready():
	pass
	
func _process(delta):
		arr_fijo = get_overlapping_areas()
		if pos_flecha == 'ui_right':
			rotation_degrees = 90
		if pos_flecha == 'ui_left':
			rotation_degrees = 270
		if pos_flecha == 'ui_up':
			rotation_degrees = 0
		if pos_flecha == 'ui_down':
			rotation_degrees = 180
#		var velocity = Vector2.LEFT * speed
#		position += velocity * delta
#		if arr_fijo != []:
#			print("arr_fijo ", arr_fijo.size())
#			print(get_index())
#			print(get_overlapping_bodies())
