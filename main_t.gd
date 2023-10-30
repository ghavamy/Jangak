extends Node2D

var laser_scene = preload("res://laser.tscn")
var grenade_scene = preload("res://grenade.tscn")
var enemy_scene = preload("res://enemy_ai.tscn")

var bullets

func _ready():
	bullets = get_node("projectiles")
	Manager.bullets_pool.add_to_node(bullets)
	set_process_input(true)
	
func _process(delta):
	$CanvasLayer/Score.text = str(Manager.score)
	
func _on_player_laser():
	var laser = Manager.bullets_pool.get_first_dead()
	laser.show()
	laser.position = $player/Gun1.pos
	laser.direction = (get_global_mouse_position() - $player.global_position).normalized()
	laser.set_collision_mask_value(1,true)
	laser.get_node("Timer").start()



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

