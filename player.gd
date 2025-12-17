class_name Player
extends RigidBody3D

var bulletScene : PackedScene = preload("res://bullet.tscn")

var elapsed : float = 0
var frequency : float = 0.3

signal damage(energia : int)

func _physics_process(delta: float) -> void:
	var dirX : float = Input.get_axis("ui_right", "ui_left")
	var jump : bool = Input.is_key_pressed(KEY_SPACE)
	
	linear_velocity.x = dirX * 5
	
	if(jump && abs(linear_velocity.y) < 0.01):	# salto del player
		linear_velocity.y = 3.75
		
	if(dirX == 0) :	# movimento con tasti A e D
		linear_velocity.x = 0
		if(Input.is_key_pressed(KEY_A)) :
			linear_velocity.x = 5
		if(Input.is_key_pressed(KEY_D)) :
			linear_velocity.x = -5
			
	pass

func _process(delta: float) -> void:
	elapsed += delta
	if(elapsed >= frequency && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):	# proiettile volante
		elapsed = 0
		var bi : Bullet = bulletScene.instantiate()
		get_parent_node_3d().add_child(bi)
		bi.position.z = self.position.z + 0.75
		bi.position.x = self.position.x
		bi.position.y = 0.9
		bi.gravity_scale = 0	# gravita assente
		
	if(elapsed >= frequency && Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):	# proiettile cadente
		elapsed = 0
		var bi : Bullet = bulletScene.instantiate()
		get_parent_node_3d().add_child(bi)
		bi.position.z = self.position.z + 0.75
		bi.position.x = self.position.x
		bi.position.y = 0.9	
		bi.gravity_scale = 1	# gravita presente
	pass


func _on_body_entered(body: Node) -> void:
	if(body is Enemy) :
		damage.emit(1)
	pass # Replace with function body.
