extends CharacterBody2D

func _ready() -> void:
	add_to_group("bloque")

func recibirChoque() -> void:
	queue_free()
