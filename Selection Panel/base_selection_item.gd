extends Panel
class_name BaseSelectionItem

static var current_plant_selection_state: int = Globals.Plant_Select_States.PLANT_NOT_SELECTED

func _on_mouse_entered() -> void:
	if current_plant_selection_state != Globals.Plant_Select_States.PLANT_SELECTED:
		current_plant_selection_state = Globals.Plant_Select_States.PLANT_IS_BEING_SELECTED
		scale = Vector2(1.075, 1.075)

func _on_mouse_exited() -> void:
	if current_plant_selection_state != Globals.Plant_Select_States.PLANT_SELECTED:
		current_plant_selection_state = Globals.Plant_Select_States.PLANT_NOT_SELECTED
	scale = Vector2(1, 1)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("L_Click") and current_plant_selection_state == Globals.Plant_Select_States.PLANT_IS_BEING_SELECTED:
		buy_plant()

func buy_plant() -> void:
	Events.plant_bought.emit(name)
	current_plant_selection_state = Globals.Plant_Select_States.PLANT_SELECTED

#func place_plant() -> void:
	#var new_plant = PLANT.instantiate()
	#add_child(new_plant)
	#placing = false
	#current_plant_selection_state = Globals.Plant_Select_States.PLANT_NOT_SELECTED
