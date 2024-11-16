extends Node2D

var state = "no apples"
var player_in_area = false


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
				$growth_timer.start()


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
