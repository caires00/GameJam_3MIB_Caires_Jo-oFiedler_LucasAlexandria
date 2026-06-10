extends CharacterBody2D

const SPEED = 80.0
const GRAVITY = 800.0

var direction = 1

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@onready var left_limit: Marker2D = $"../left_limit"
@onready var right_limit: Marker2D = $"../right_limit"

func _physics_process(delta):
	# Aplica gravidade
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Verifica os limites
	if global_position.x >= right_limit.global_position.x:
		direction = -1

	if global_position.x <= left_limit.global_position.x:
		direction = 1

	# Movimento horizontal
	velocity.x = direction * SPEED

	# Vira o sprite
	anim.flip_h = direction > 0

	# Toca animação
	if anim.animation != "walk":
		anim.play("walk")

	# Move o personagem
	move_and_slide()
