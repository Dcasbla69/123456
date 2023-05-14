extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var dmg = 25
export var speed = 300
onready var player = get_node("/root/Node2D/Player")
onready var enemies = get_node("/root/Node2D/Enemics")
var target = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(enemies)
	if enemies.size() > 0:
		print("b")
		target = enemies[0]
		for i in enemies:
			if player.position.distance_to(i.position) < player.position.distance_to(target.position):
				target = i
				print(target)
				
	if target:
		print("target")
		var direction = (global_position.direction_to(target.global_position)).normalized()
	
		var velocity = direction * speed * delta *20
	
		move_and_slide(velocity)
