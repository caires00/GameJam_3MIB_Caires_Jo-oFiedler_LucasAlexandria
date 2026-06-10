extends Area2D


func _ready():
	body_entered.connect(_on_body_entered)
# Toda vez que um corpo entra na Area2D, a função _on_body_entered recebe
# automaticamente como parâmetro o nó que entrou nessa área, representado
# pelo body
func _on_body_entered(body):
# verifica se o nó que entrou na área tem o método die()
	if body.has_method("die"):
# chama a função die() desse nó que entrou na área
		body.die()
