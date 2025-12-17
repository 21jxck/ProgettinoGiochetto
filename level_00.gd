extends Node3D

var enemyScene : PackedScene = preload("res://enemy.tscn")

var elapsed : float = 0
var frequency : float = 1

var punti : int = 0
var energia : int = 10

func _ready() -> void:
	$GUI/lblPunti.text = "Punti: " + str(self.punti)
	$GUI/lblEnergia.text = "Energia: " + str(self.energia)
	

func _process(delta: float) -> void:
	elapsed += delta
	if(elapsed >= frequency):
		elapsed = 0
		print("Enemy generated")
		var ei : Enemy = enemyScene.instantiate()
		self.add_child(ei)
		ei.killed.connect(_killed_enemy)
		ei.position.z = 17
		ei.position.x = randf_range(-2.2, 2.2)
		var randomNumber = randi_range(1,4)
		#if(randomNumber == 4) :
		if(randomNumber == 5) :		# nemico orizzontale se randomNumber = 4
			ei.rotate_object_local(Vector3.FORWARD, deg_to_rad(90.0))
			ei.rotate_object_local(Vector3.LEFT, deg_to_rad(90.0))
			ei.position.y = 0.5
	pass
	
func _killed_enemy(punti : int) :
	self.punti += punti
	_ready()
	pass

func _on_player_damage(energia: int) -> void:
	self.energia -= energia
	if(self.energia <= 0) :
		get_tree().change_scene_to_file("res://game_over.tscn")
	_ready()
	pass # Replace with function body.


func _on_a_3d_bullet_body_entered(body: Node3D) -> void:
	if(body is Bullet) :
		body.call_deferred("queue_free")
	pass # Replace with function body.


func _on_a_3d_enemy_body_entered(body: Node3D) -> void:
	if(body is Enemy) :
		body.call_deferred("queue_free")
	pass # Replace with function body.
