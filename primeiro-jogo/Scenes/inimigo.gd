extends CharacterBody2D

const SPEED = 80.0
const GRAVITY = 800.0

var direction = 1


@onready var floor_left: Raycast2D = $FloorLeft 

# nome do nó
@onready var floor_right: RayCast2D = $FloorRight
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@onready var left_limit: Marker2D = $"../left_limit"
@onready var right_limit: Marker2D = $"../right_limit"

func _physics_process(delta):
# Garante que a gravidade seja aplicada ao inimigo caso ele não esteja no chão
	if not is_on_floor():
		velocity.y += GRAVITY * delta
# Inverte ao detectar borda com o método padrão do Raycast2D is_colliding()
	if position.x >= right_limit.global_position.x:
		direction = -1
	if position.x <= left_limit.global_position.x:
		direction = 1
# Aplica velocidade no eixo x
	velocity.x = direction * SPEED
# Vira o sprite do personagem se estiver indo para a direita
	anim.flip_h = direction > 0
# Roda a animação de caminhar
	anim.play("walk")
	
func _on_timer_timeout() -> void:
	direction *= -1
# Move o inimigo
		move_and_slide()
