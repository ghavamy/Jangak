extends Area2D

var direction: Vector2

@onready var speed = 1500

func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
		recycle()


func recycle():
	Manager.bullets_pool._on_killed(self)
	set_collision_mask_value(1,false)
	self.hide()
	$Timer.stop()


func _on_timer_timeout():
	recycle()
