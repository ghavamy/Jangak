extends Sprite2D

var pos
func _process(_delta):
	pos = $Marker2D.global_position
	Manager.flipping($".")
	
