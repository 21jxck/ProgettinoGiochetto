extends RigidBody3D

var bulletScene : PackedScene = preload("res://bullet.tscn")

var elapsed : float = 0
var frequency : float = 0.3

func _physics_process(delta: float) -> void:
	var dirX : float = Input.get_axis("ui_right", "ui_left")
	var dirZ : float = Input.get_axis("ui_down", "ui_up")
	var jump : bool = Input.is_key_pressed(KEY_SPACE)
	
	linear_velocity.x = dirX * 5
	linear_velocity.z = dirZ * 5
	if(jump && abs(linear_velocity.y) < 0.01):
		linear_velocity.y = 3.75
	pass

func _process(delta: float) -> void:
	elapsed += delta
	if(elapsed >= frequency && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		elapsed = 0
		var bi : Bullet = bulletScene.instantiate()
		get_parent_node_3d().add_child(bi)
		bi.position.z = self.position.z + 0.5
		bi.position.x = self.position.x
		bi.position.y = 0.9
		bi.gravity_scale = 0
		
	if(elapsed >= frequency && Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
		elapsed = 0
		var bi : Bullet = bulletScene.instantiate()
		get_parent_node_3d().add_child(bi)
		bi.position.z = self.position.z + 0.5
		bi.position.x = self.position.x
		bi.position.y = 0.9	
		bi.gravity_scale = 1
	pass
