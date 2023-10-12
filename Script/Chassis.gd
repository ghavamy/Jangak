extends RigidBody2D

const housepower = 30
var speed = 0
var maxSpeed = 50
var x
var y
var rotationSpeed = 0.
var speedVec = Vector2(0,0)



func _physics_process(delta):
	if Input.is_action_pressed("Up"):
		if speed < maxSpeed:
			speed += housepower * delta
			

