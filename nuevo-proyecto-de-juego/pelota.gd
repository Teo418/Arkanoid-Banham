extends CharacterBody2D

const VELOCIDAD_INICIAL = 300.0
const INCREMENTO_VELOCIDAD = 10.0
const VELOCIDAD_MAXIMA = 500.0

var velocidad := VELOCIDAD_INICIAL

func _ready() -> void:
	velocity = Vector2(velocidad, -velocidad).normalized() * velocidad

func _physics_process(delta: float) -> void:
	var colision = move_and_collide(velocity * delta)
	if colision:
		var choque = colision.get_collider()
		if choque.is_in_group("bloque"):
			choque.recibirChoque()
			_aumentarVelocidad()
			_verificarWin()
		velocity = velocity.bounce(colision.get_normal())
	var pantalla := get_viewport_rect().size
	if position.x <= 0 or position.x >= pantalla.x:
		velocity.x *= -1
 
	if position.y <= 0:
		velocity.y *= -1
 
	if position.y >= pantalla.y:
		get_tree().call_group("game_manager", "mostrar_game_over")

func _aumentarVelocidad() -> void:
	velocidad = min(velocidad+INCREMENTO_VELOCIDAD, VELOCIDAD_MAXIMA)
	velocity = velocity.normalized() * velocidad
func _verificarWin() -> void:
	var bloquesRestantes = get_tree().get_nodes_in_group("bloques").size()
	if bloquesRestantes == 0:
		get_tree().call_group("game_manager", "mostrar_you_win")
