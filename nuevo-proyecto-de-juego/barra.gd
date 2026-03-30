extends CharacterBody2D

const VELOCIDAD_MOVIMIENTO = 300.0
const PALETA = 25

func _physics_process(delta: float) -> void:
	var direccion := 0.0
	if Input.is_action_pressed("ui_left"):
		direccion = -1.5
	if Input.is_action_pressed("ui_right"):
		direccion = 1.5
	velocity.x = direccion * VELOCIDAD_MOVIMIENTO
	velocity.y = 0.0
	move_and_slide()
	var pantalla := get_viewport_rect().size
	position.x = clamp(position.x, PALETA, pantalla.x - PALETA)
