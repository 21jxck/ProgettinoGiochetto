class_name Enemy
extends RigidBody3D

func _physics_process(delta: float) -> void:
	linear_velocity.z = -5


func _on_body_entered(body: Node) -> void:
	if (body is Bullet) :
		call_deferred("queue_free")
		body.call_deferred("queue_free")
	pass # Replace with function body.
