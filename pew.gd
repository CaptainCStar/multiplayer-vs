extends RigidBody2D

class_name shooty
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	$Timer.start()
#	queue_free()
	pass # Replace with function body.


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
