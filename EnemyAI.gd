extends CharacterBody2D

var direction = Vector2()
var speed: float = 10000
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	direction =  $"../player".position- $".".position
	velocity = direction.normalized() * speed * delta
	move_and_slide()
func hit():
	queue_free()
