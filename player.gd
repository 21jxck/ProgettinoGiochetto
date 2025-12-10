extends RigidBody3D

func _physics_process(delta: float) -> void:
	var dir : float = Input.get_axis("ui_right", "ui_left")
	linear_velocity.x = dir * 5
