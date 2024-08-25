extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _on_player_dead():
	$Timer.start()
	#get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_player_2_dead():
	$Timer.start()
	#get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://level_2.tscn")
	pass # Replace with function body.
