extends Area2D

func _ready():
	pass
	
func _process(delta):
	var arr = get_overlapping_areas()
#	if arr != []:
#		print("el array es", arr)
