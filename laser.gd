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
		queue_free()
