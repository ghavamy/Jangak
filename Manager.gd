extends Node2D

var poolscript = preload("res://pool.gd")

var bullets_pool

var score = 0

# for bullet pool
const bullet = preload("res://laser.tscn")
const BULLET_POOL_SIZE = 20
const BULLET_POOL_PREFIX = "bullet"


# Called when the node enters the scene tree for the first time.
func _ready():
	bullets_pool = poolscript.new(BULLET_POOL_SIZE, BULLET_POOL_PREFIX, bullet)
	
	
func flipping(body):
	if (body.global_rotation < PI* (-1)/2 and body.global_rotation > PI * (-1)) or (body.global_rotation > PI/2 and body.global_rotation < PI):
		body.flip_v = true
	else:
		body.flip_v = false
