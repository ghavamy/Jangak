extends CharacterBody2D

var movespeed = 30000
var can_laser = true
var can_grenade = true

var hitpoint = 100


signal laser
signal grenade

func _ready():
	$Marker2D/ProgressBar.set_value_no_signal(100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("left", "right" ,"up" ,"down")
	velocity = direction * movespeed * delta
	move_and_slide()
	look_at(get_global_mouse_position())
	Manager.flipping($Sprite2D)
	
	#for progess bar
	if($Sprite2D.flip_v):
		$Marker2D.rotation = PI
	else:
		$Marker2D.rotation = 0

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
		

func _on_player_area_body_entered(body):
	if "hit" in body:
		body.hit()
		hitpoint -=10
		$Marker2D/ProgressBar.set_value_no_signal(hitpoint)
	if hitpoint<=0:
		get_tree().reload_current_scene()
