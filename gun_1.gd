extends Sprite2D

var pos
func _process(delta):
	pos = $Marker2D.global_position
	$"..".flipping($".")
	
