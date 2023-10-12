extends Node2D

var laser_scene = preload("res://laser.tscn")
var grenade_scene = preload("res://grenade.tscn")

#@export var speed: int = 100

func _on_player_laser():
	var laser = laser_scene.instantiate()
	laser.position = $player/Gun1.pos
	laser.direction = (get_global_mouse_position() - $player.global_position).normalized()
	print(laser.direction)
	$projectiles.add_child(laser)



func _on_player_grenade():
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = $player.position
	grenade.linear_velocity = Vector2.UP * 500
	$projectiles.add_child(grenade)
