extends Sprite2D
class_name BasePlantProp

func _physics_process(delta: float) -> void:
	_selected_state()

func _selected_state() -> void:
	global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("L_Click"):
		Events.prop_placed.emit()
