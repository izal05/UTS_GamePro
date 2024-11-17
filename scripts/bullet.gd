extends Area2D

var speed = 700

func _physics_process(delta):
	
	position += transform.x * speed * delta 


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	
	if body.has_method("take_damage"):
		body.take_damage()
