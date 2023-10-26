signal killed(target)

var prefix #prefix of the object spwaned
var size #for pool size
var scene #preloaded scene

var alive = {} #for alive objects in pool
var dead = [] #list of dead objects

func _init(size_,prefix_,scene_):
	size = size_
	prefix = prefix_
	scene = scene_
	init()
	
func init():
	
	if scene == null:
		return
	
	for i in range(size):
		var s = scene.instantiate()
		s.set_name(prefix + "_" + str(i))
		dead.push_back(s)

func get_first_dead():
	var ds = dead.size()
	if ds > 0:
		var o = dead[ds - 1]
#		if !o.dead: return null

		var n = o.get_name()
		alive[n] = o
		dead.pop_back()
#		o.dead = false
#		o.set_pause_mode(0)
		return o

	return null
	
func get_first_alive():
	if alive.size() > 0:
		return alive.values()[0]

	return null
	
func kill_all():
	for i in alive.values():
		i.kill()

func add_to_node(node):
	for i in alive.values():
		node.add_child(i)

	for i in dead:
		node.add_child(i)
	
	_hide()

func _show():
	for i in alive.values():
		i.show()

	for i in dead:
		i.show()

func _hide():
	for i in alive.values():
		i.hide()

	for i in dead:
		i.hide()

func _on_killed(target):
	# Get the name of the target object that was killed
	var name = target.get_name()

	# Remove the killed object from the alive pool
	alive.erase(name)

	# Add the killed object to the dead pool, now available for use
	dead.push_back(target)

#	target.set_pause_mode(1)
	print(target)

	emit_signal("killed", target)
