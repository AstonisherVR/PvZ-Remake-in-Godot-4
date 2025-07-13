extends CanvasLayer
class_name UI

@export var PLANT_PROPS: Array[PackedScene]
@export var PLANTS: Array[PackedScene]
@onready var shovel_texture: TextureRect = %"Shovel Texture"

@export_enum("White", "Yellow", "Orange") var my_color: String
var my_dict: Dictionary = {}

func buy_plant() -> void:
	var new_prop_plant: PackedScene = PLANT_PROPS.pick_random()
	var new_prop_plant_instance := new_prop_plant.instantiate() as BasePlantProp
	add_sibling.call_deferred(new_prop_plant_instance)
	#placing_plant = true

func place_plant() -> void:
	var new_plant: PackedScene = PLANTS.pick_random()
	var new_plant_instance := new_plant.instantiate()
	add_sibling.call_deferred(new_plant_instance)
	#new_plant_instance.global_position = get_node("/root/World/BaseProp").global_position
	get_node("/root/World/BaseProp").queue_free()
	#placing_plant = false

func _on_peashooter_selection_panel_plant_bought() -> void:
	buy_plant()
func _on_sunflower_selection_item_plant_bought() -> void:
	buy_plant()
func _on_wallnut_selection_item_plant_bought() -> void:
	buy_plant()

#func _on_mouse_entered() -> void:
	#if current_plant_selection_state != Globals.Plant_Select_States.PLANT_SELECTED:
		#current_plant_selection_state = Globals.Plant_Select_States.PLANT_IS_BEING_SELECTED
		#scale = Vector2(1.075, 1.075)
#
#func _on_mouse_exited() -> void:
	#if current_plant_selection_state != Globals.Plant_Select_States.PLANT_SELECTED:
		#current_plant_selection_state = Globals.Plant_Select_States.PLANT_NOT_SELECTED
	#scale = Vector2(1, 1)
#
#func handle_mouse_input() -> void:
	#if Input.is_action_pressed("L_Click") and current_plant_selection_state == Globals.Plant_Select_States.PLANT_IS_BEING_SELECTED:
		#current_plant_selection_state = Globals.Plant_Select_States.PLANT_SELECTED
		##selecting = false

func _on_shovel_texture_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("L_Click"):
		shovel_texture.global_position.y -= 10
