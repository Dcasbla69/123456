extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
export var health = 100
var escena_enemic = preload("res://BatEnemy.tscn")
var magicOrb = preload("res://MagicOrb.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
# warning-ignore:return_value_discarded
	$Timer.connect("timeout", self, "_on_spawn_timer_timeout")
	$Timer.start()
	$Timer2.connect("timeout", self, "_on_spawn_timer2_timeout")
	$Timer2.start()

func UpdateHealthBar():
	var bar = $Control/ProgressBar
	bar.value = health
	if health <= 20:
		bar.modulate = Color(1,0,0)
	elif health <= 50 and health > 20:
		bar.modulate = Color(1,1,0)
	elif health <= 100 and health > 50:
		bar.modulate = Color(0,1,0)

func take_damage(damage):
	health -= damage
	if health <= 0:
		# Player has died
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://mort.tscn")


func spawn_enemy():
	var enemy = escena_enemic.instance()
	
	var spawn_pos = global_position + (Vector2.RIGHT * 300).rotated(rand_range(0, 2*PI))
	enemy.global_position = spawn_pos
	Global.Enemics.add_child(enemy)

func spawn_projetile(curs):
	print("a")
	var proj = magicOrb.instance()
	proj.cursPos = curs
	var spawn_pos = global_position
	
	proj.global_position = spawn_pos
	Global.Abilities.add_child(proj)
	
	
	
func _on_spawn_timer_timeout():
	spawn_enemy()

func _on_spawn_timer2_timeout():
	spawn_projetile(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	UpdateHealthBar()
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
	if Input.is_action_just_pressed("ret"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu2.tscn")
	# Normalize the direction vector to ensure diagonal movement isn't faster
	direction = direction.normalized()

	# Move the character
	var velocity = direction * speed * delta * 20
	velocity = move_and_slide(velocity)

