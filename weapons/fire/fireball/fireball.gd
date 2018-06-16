extends "res://weapons/damage_areas/damage_source.gd"

export(PackedScene) var Explosion
export(float) var SPEED = 1000.0
var direction = Vector2()

func _physics_process(delta):
	position += direction * SPEED * delta

func _on_Fireball_body_entered(body):
	explode()

func _on_Fireball_area_entered(area):
	print('hey')
	explode()

func explode():
	set_physics_process(false)
	$Fireball.active = false
	
	var explosion_node = Explosion.instance()
	add_child(explosion_node)
	
	get_tree().create_timer(explosion_node.lifetime * 2.0).connect("timeout", self, "queue_free")