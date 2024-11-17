extends CharacterBody2D

var speed = 500
var rotation_speed = 5

const BULLET = preload("res://scenes/bullet.tscn")
@onready var shooting_point: Marker2D = $shooting_point

func _physics_process(delta):
	
	var rotation_direction = Input.get_axis("p2_left", "p2_right")
	
	rotation += rotation_direction * rotation_speed * delta
	
	var direction = Input.get_axis("p2_up", "p2_down")
	
	velocity = -direction * speed * transform.x
	move_and_slide()
	
	if Input.is_action_just_pressed("p2_shoot"):
		shoot()
		
func shoot ():
	var bullet = BULLET.instantiate()
	bullet.global_position = shooting_point.global_position
	bullet.rotation = rotation
	bullet.speed = -bullet.speed
	get_parent().add_child(bullet)

func take_damage():
	queue_free()
	get_parent().increment_p1_score()
	get_parent().respawn_p2()
