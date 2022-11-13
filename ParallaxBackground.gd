extends ParallaxBackground


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


func _input(event):
	if event is InputEventMouseMotion:
		moverLayer(event, layer1, vel/5)
		moverLayer(event, musico1, vel*0.7)
		moverLayer(event, musico2, vel)
		moverLayer(event, musico3, vel*0.5)
		moverLayer(event, musico4, vel*1.3)
		moverLayer(event, gente, vel*2.5)
		moverLayer(event, gente2, vel*5)
		

func moverLayer(event, obj, vel): 
	var mouse_x = event.position.x
	var mouse_y = event.position.y
	var viewport_size=get_viewport().size
	var relative_x = (mouse_x - (viewport_size.x/2)) / (viewport_size.x/2)
	var relative_y = (mouse_y - (viewport_size.y/2)) / (viewport_size.y/2)
	obj.motion_offset.x = vel * -relative_x
	obj.motion_offset.y = vel * -relative_y
