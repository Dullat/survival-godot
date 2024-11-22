extends CharacterBody2D
var motion = Vector2()

func _ready() -> void:
	$AnimationPlayer.play("fade")
	print("started")

func _physics_process(delta):
	var player = get_parent().get_node("player")
	position += (player.position - position)/10
	#look_at(player.position)
	move_and_collide(motion)
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.stop()
	_pop_apple()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		_pop_apple()
		

func _pop_apple():
	queue_free()
