extends Node2D

var poolscript = preload("res://pool.gd")

var bullets_pool

# for bullet pool
const bullet = preload("res://laser.tscn")
const BULLET_POOL_SIZE = 20
const BULLET_POOL_PREFIX = "bullet"


# Called when the node enters the scene tree for the first time.
func _ready():
	bullets_pool = poolscript.new(BULLET_POOL_SIZE, BULLET_POOL_PREFIX, bullet)
	
	
func flipping(body):
	if (body.global_rotation < deg_to_rad(-90) and body.global_rotation > deg_to_rad(-180)) or (body.global_rotation > deg_to_rad(90) and body.global_rotation < deg_to_rad(180)):
		body.flip_v = true
	else:
		body.flip_v = false
