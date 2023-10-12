extends CharacterBody2D

var rotationSpeed = 1



func _physics_process(delta):
	var direction = (get_global_mouse_position() - global_position)
	var angle = direction.angle()
	var r = global_rotation
	var angle_delta = rotationSpeed * delta
	angle = lerp_angle(r, angle, 0.5)
	angle = clamp(angle, r - angle_delta, r + angle_delta)
	global_rotation = angle

