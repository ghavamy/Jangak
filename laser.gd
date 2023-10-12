extends Area2D

var direction: Vector2
var speed = 2000

func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	position += direction * speed * delta
	

