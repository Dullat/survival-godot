extends CharacterBody2D

@export var speed = 100

var player_state

@export var inv: Inv

func _ready() -> void:
	for item in inv.items:
		print(item)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = direction * speed
	move_and_slide()
	play_anim(direction)
	
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.x == 1:
			$AnimatedSprite2D.play("E_walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("W_walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("S_walk")
		if dir.y == -1:
			$AnimatedSprite2D.play("N_walk")
		
		
		if dir.y > .5 and dir.x > .5:
			$AnimatedSprite2D.play("SE_walk")
		if dir.y < -.5 and dir.x > .5:
			$AnimatedSprite2D.play("NE_walk")
		if dir.y > .5 and dir.x < -.5:
			$AnimatedSprite2D.play("SW_walk")
		if dir.y < -.5 and dir.x < -.5:
			$AnimatedSprite2D.play("NW_walk")

func player():
	pass
