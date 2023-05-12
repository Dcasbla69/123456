extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100
export var health = 50
onready var player = get_node("/root/Node2D/Player")
var canhit = true
var objectiu = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = (global_position.direction_to(player.global_position)).normalized()

	# Move the enemy towards the player
	var velocity = direction * speed * delta *20
	move_and_slide(velocity)



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		objectiu = body
		$Timer.start()


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		objectiu = null
		$Timer.stop()

func _on_Timer_timeout():
	objectiu.take_damage(10)
	$Timer.start()
