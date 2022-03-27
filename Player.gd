extends SGKinematicBody2D

const SPEED        := 65536*30

var ZERO     := SGFixedVector2.new()
var velocity := SGFixedVector2.new()
var speed    := 0.0

onready var label := $Label

func _physics_process(delta: float) -> void:
	var vector: SGFixedVector2 = _get_local_input().get("input_vector", SGFixed.vector2(0, 0))

	velocity = move_and_slide(vector.mul(SPEED))
	label.text = str(velocity.x) + ", " + str(velocity.y)

func _get_local_input() -> Dictionary:
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

	var input := {}
	if input_vector != Vector2.ZERO:
		input["input_vector"] = SGFixed.from_float_vector2(input_vector)

	return input
