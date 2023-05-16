extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var fuente = DynamicFont.new()
	fuente.font_data = load("res://Assets/opts/BlackJaguarDemoRegular.ttf")
	#$Timer.start()
	var Play = Button.new()
	var tp = 35
	Play.text = "Menu"
	Play.connect("pressed", self, "_on_menu_pressed")
	Play.set_position(Vector2(50, 1000))
	Play.set_size(Vector2(250,50))
	Play.set("custom_fonts/font", fuente)
	Play.set_anchor(MARGIN_RIGHT, -0.005)
	add_child(Play)
	var font : DynamicFont = Play.get("custom_fonts/font") 
	font.extra_spacing_top = 20
	font.extra_spacing_bottom = -10
	var mon = Global.get("Money")
	print(mon)
	$money.text = str(mon)
	$money.set_size(Vector2(1000, 1000))
	
	
	
func _on_menu_pressed():
	get_tree().change_scene("res://Menu2.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ret"):
		get_tree().change_scene("res://Menu2.tscn")


#func _on_Timer_timeout():
#	get_tree().change_scene("res://Menu2.tscn")
