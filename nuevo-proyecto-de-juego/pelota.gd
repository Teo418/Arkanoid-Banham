extends CharacterBody2D

const VELOCIDAD_INICIAL = 300.0
const INCREMENTO_VELOCIDAD = 10.0
const VELOCIDAD_MAXIMA = 500.0

var velocidad := VELOCIDAD_INICIAL

func _ready() -> void:
	velocity = Vector2(velocidad, -velocidad).normalized() * velocidad

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var colision = move_and_collide(velocity * delta)
	if colision:
		var choque = colision.get_collider()
		if choque.is_in_group("bloques")
			choque.recibirChoque()
