extends Node2D

var state = "no apples"
var player_in_area = false
var apple = preload("res://SCENES/apple_collectable.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if state == "no apples":
		$growth_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == "no apples":
		$AnimatedSprite2D.play("no apples")
	if state == "apples":
		$AnimatedSprite2D.play("apples")
		if player_in_area == true:
			if Input.is_action_just_pressed("e"):
				state = "no apples"
				print(state)
				_drop_apple()


func _on_pickablearea_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true
		print("entered")


func _on_pickablearea_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		print("exited")
		


func _on_growth_timer_timeout() -> void:
	if state == "no apples":
		state = "apples"
		

func _drop_apple():
	var apple_instance = apple.instantiate()
	apple_instance.global_position = $Marker2D.global_position
	get_parent().add_child(apple_instance)
	await get_tree().create_timer(3).timeout
	$growth_timer.start()