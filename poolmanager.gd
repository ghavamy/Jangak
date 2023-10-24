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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
