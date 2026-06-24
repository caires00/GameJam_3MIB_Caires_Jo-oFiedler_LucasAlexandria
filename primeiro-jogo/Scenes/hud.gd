extends CanvasLayer

@onready var health_label: Label = $Control/HealthLabel

@onready var coin_label: Label = $Control/CoinLabel


@onready var coracoes: HBoxContainer = $Control/HBoxContainer


# Quando carregar na cena, chamar a função atualizar_vidas()
func _ready() -> void:
	atualizar_vidas()
	atualizar_moedas()
# função que atualiza a label para o valor da variável vidas no GameManager
func atualizar_vidas() -> void:
	health_label.text = "Vidas: " + str(GameManager.vidas)
	
func atualizar_moedas() -> void:
	coin_label.text = "Moedas: " + str(GameManager.moedas)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
