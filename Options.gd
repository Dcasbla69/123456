extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


func _process(delta):
	if Input.is_action_just_pressed("ret"):
		get_tree().change_scene("res://Menu2.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Menu2.tscn")
