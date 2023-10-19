extends Node2D

var laser_scene = preload("res://laser.tscn")
var grenade_scene = preload("res://grenade.tscn")
var enemy_scene = preload("res://enemy_ai.tscn")


func _on_player_laser():
	var laser = laser_scene.instantiate() as Area2D
	laser.position = $player/Gun1.pos
	laser.direction = (get_global_mouse_position() - $player.global_position).normalized()
	add_child(laser)



func _on_player_grenade():
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = $player.position
	grenade.linear_velocity = Vector2.UP * 500
	$projectiles.add_child(grenade)

func spawn_Enemies(pos):
	var enemy = enemy_scene.instantiate()
	enemy.position = pos
	add_child(enemy)
	

func _on_timer_timeout():
	spawn_Enemies($Marker2D.position)
