class_name Enemy
extends RigidBody3D

signal killed(punti : int)

var speed : float = 0

func _physics_process(delta: float) -> void:
	linear_velocity.z = speed

func _on_body_entered(body: Node) -> void:
	if (body is Bullet) :
		$AnimationTree.set("parameters/conditions/isHit", true)
		speed = 0
		$CollisionShape3D.disabled = true
		body.call_deferred("queue_free") # cancella il bullet
		killed.emit(1)
	pass


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "general/Skeletons_Spawn_Ground"):
		speed = -3
	elif(anim_name == "general/Skeletons_Death"):
		call_deferred("queue_free")
	pass # Replace with function body.
