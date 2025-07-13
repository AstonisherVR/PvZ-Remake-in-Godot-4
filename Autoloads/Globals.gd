extends Node

enum Plant_Select_States {PLANT_NOT_SELECTED, PLANT_IS_BEING_SELECTED, PLANT_SELECTED}
static var grid_positions: Array = []

func reset_game() -> void:
	get_tree().reload_current_scene()
