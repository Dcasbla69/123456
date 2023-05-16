extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	var Play = Button.new()
	Play.text = "Menu"
	Play.connect("pressed", self, "_on_menu_pressed")
	Play.set_position(Vector2(50, 1000))
	Play.set_size(Vector2(250,50))
	add_child(Play)
	
	
func _on_menu_pressed():
	get_tree().change_scene("res://Menu2.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ret"):
		get_tree().change_scene("res://Menu2.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Menu2.tscn")
