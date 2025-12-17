class_name Bullet
extends RigidBody3D

func _physics_process(delta: float) -> void:
	linear_velocity.z = 4
