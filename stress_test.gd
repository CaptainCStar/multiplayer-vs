extends Node2D

var Pscore = 0

func _physics_process(delta):
	Events.Ppoops.connect(Pcount)
	print(Pscore)

func Pcount():
	Pscore += 1
	
