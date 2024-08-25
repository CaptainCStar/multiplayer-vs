extends CharacterBody2D


var shoot = preload("res://pew.tscn")
var can_shoot = true

var shoots = 0
@export var shoot_speed = 1000
@export var shoot_rate = 1

func _physics_process(delta):
	#print(shoots)
	Events.Ppoops.emit()
	var shoot_inst = shoot.instantiate()
	shoot_inst.position = $Spoint.get_global_position()
	shoot_inst.rotation_degrees = rotation_degrees
	shoot_inst.apply_impulse(Vector2(shoot_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(shoot_inst)
	shoots += 1
	#var shoot_inst = shoot.instantiate()
	#shoot_inst.position = $Spoint.get_global_position()
	#shoot_inst.rotation_degrees = rotation_degrees
	#shoot_inst.apply_impulse(Vector2(shoot_speed, 0).rotated(rotation_degrees))
	#get_tree().get_root().add_child(shoot_inst)


#func _on_player_shoot():
	#print("ghuhuhuh")
	#var shoot_inst = shoot.instantiate()
	#shoot_inst.position = $Spoint.get_global_position()
	#shoot_inst.rotation_degrees = rotation_degrees
	#shoot_inst.apply_impulse(Vector2(shoot_speed, 0).rotated(rotation))
	#get_tree().get_root().add_child(shoot_inst)
	#shoots += 1
	pass # Replace with function body.
