extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
export var health = 100
var escena_enemic = preload("res://BatEnemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Timer.connect("timeout", self, "_on_spawn_timer_timeout")
	$Timer.start()

func take_damage(damage):
	print("b")
	health -= damage
	if health <= 0:
		# Player has died
		get_tree().reload_current_scene()


func spawn_enemy():
	var enemy = escena_enemic.instance()
	
	var spawn_pos = global_position + (Vector2.RIGHT * 300).rotated(rand_range(0, 2*PI))
	enemy.global_position = spawn_pos
	Global.Enemics.add_child(enemy)



func _on_spawn_timer_timeout():
	spawn_enemy()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO  # The direction the character will move in
	
	# Detect keyboard input
	if Input.is_action_pressed("MoveRight"):
		direction.x += 1
	if Input.is_action_pressed("MoveLeft"):
		direction.x -= 1
	if Input.is_action_pressed("MoveDown"):
		direction.y += 1
	if Input.is_action_pressed("MoveUp"):
		direction.y -= 1

	# Normalize the direction vector to ensure diagonal movement isn't faster
	direction = direction.normalized()

	# Move the character
	var velocity = direction * speed * delta * 20
	velocity = move_and_slide(velocity)
