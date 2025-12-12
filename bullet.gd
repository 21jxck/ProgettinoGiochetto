class_name Bullet
extends RigidBody3D

func _physics_process(delta: float) -> void:
	#gravity_scale = 0
	linear_velocity.z = 4
