extends Area2D

var direction: Vector2
var pool = preload("res://pool.gd")

@onready var speed = 1500

func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	position += direction * speed * delta
#	print(position)



func _on_body_entered(body):
	if "hit" in body:
		body.hit()
		Poolmanager.bullets_pool._on_killed(self)
		set_collision_mask_value(1,false)
	#		Main.pool._on_killed(self)
