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
var vel = 50


func _input(event):
	if event is InputEventMouseMotion:
		var mouse_x = event.position.x
		var mouse_y = event.position.y
		var viewport_size=get_viewport().size
		var relative_x = (mouse_x - (viewport_size.x/2)) / (viewport_size.x/2)
		var relative_y = (mouse_y - (viewport_size.y/2)) / (viewport_size.y/2)
		self.layer1.motion_offset.x = vel/10 * relative_x
		self.layer1.motion_offset.y = vel/10 * relative_y
		self.musico1.motion_offset.x = vel * relative_x
		self.musico1.motion_offset.y = vel * relative_y
		self.musico2.motion_offset.x = vel/2 * relative_x
		self.musico2.motion_offset.y = vel/2 * relative_y
		self.musico3.motion_offset.x = vel*2 * relative_x
		self.musico3.motion_offset.y = vel*2 * relative_y
		self.musico3.motion_offset.x = vel*3 * relative_x
		self.musico3.motion_offset.y = vel*4 * relative_y
