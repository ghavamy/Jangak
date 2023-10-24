extends CharacterBody2D
var movespeed = 30000
var can_laser = true
var can_grenade = true
var flip = false
var hitpoint = 100


signal laser
signal grenade

func _ready():
	$Marker2D/ProgressBar.set_value_no_signal(100)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("left", "right" ,"up" ,"down")
	velocity = direction * movespeed * delta
	move_and_slide()
	look_at(get_global_mouse_position())
	flipping($Sprite2D)

	if Input.is_action_pressed("primary") and can_laser:
#		print("prim")
		can_laser = false
		$Reloadprim.start()
		laser.emit()
	
	if Input.is_action_pressed("secondary") and can_grenade:
#		print("sec")
		can_grenade = false
		$Reloadsec.start()
		grenade.emit()

func _on_timer_timeout():
	can_laser = true


func _on_reloadsec_timeout():
	can_grenade = true
	
func flipping(body):
	if (body.global_rotation < deg_to_rad(-90) and body.global_rotation > deg_to_rad(-180)) or (body.global_rotation > deg_to_rad(90) and $Sprite2D.global_rotation < deg_to_rad(180) and !flip):
		body.flip_v = true
	else:
		body.flip_v = false
		

func _on_player_area_body_entered(body):
	print(hitpoint)
	hitpoint -=10
	if hitpoint<=0:
		get_tree().reload_current_scene()
	if "hit" in body:
		body.hit()
	$Marker2D/ProgressBar.set_value_no_signal(hitpoint)

