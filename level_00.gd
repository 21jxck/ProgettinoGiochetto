extends Node3D

var enemyScene : PackedScene = preload("res://enemy.tscn")

var elapsed : float = 0
var frequency : float = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	if(elapsed >= frequency):
		elapsed = 0
		print("Enemy generated")
		var ei : Enemy = enemyScene.instantiate()
		self.add_child(ei)
		ei.position.z = 17
		ei.position.x = randf_range(-2.2, 2.2)
		var randomNumber = randi_range(1,4)
		if(randomNumber == 4) :
			ei.rotate_object_local(Vector3.FORWARD, deg_to_rad(90.0))
			ei.rotate_object_local(Vector3.LEFT, deg_to_rad(90.0))
			ei.position.y = 0.5
		
	pass
