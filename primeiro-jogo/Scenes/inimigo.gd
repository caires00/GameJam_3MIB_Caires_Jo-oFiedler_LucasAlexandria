extends CharacterBody2D

const SPEED = 80.0
const GRAVITY = 800.0

var direction = 1
@onready var floor_left: RayCast2D = $FloorLeft
@onready var floor_right: RayCast2D = $FloorRight


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# Aplica gravidade
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	
	if  floor_left.is_colliding():
		direction = 1
	if  floor_right.is_colliding():
		direction = -1



	# Movimento horizontal
	velocity.x = direction * SPEED

	# Vira o sprite
	anim.flip_h = direction > 0

	# Toca animação
	if anim.animation != "walk":
		anim.play("walk")

	# Move o personagem
	move_and_slide()
