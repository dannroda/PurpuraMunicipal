extends CanvasLayer

export var combo = 0
export var vidas = 3
export var score = 0
# Called when th node enters the scene tree for the first time.
func _ready():
	pass
func _progress(delta):
	$ScoreText/ScoreValue.text = var2str(score)
	$Combo/ComboValue.text = var2str(combo)
	$VidasText/VidasCount.text = var2str(vidas)
