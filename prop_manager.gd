extends Node

const PLANT_PROPS: Array[PackedScene] = [preload("res://Prop Plants/base_plant_prop.tscn"), ]

func _ready() -> void:
	Events.plant_bought.connect(create_prop)

func create_prop(which_plant_bought: String) -> void:
	match which_plant_bought:
		"WallnutSelectionItem":
			var new_wallnut_prop_scene: PackedScene = PLANT_PROPS[0]
			var new_wallnut_instance := new_wallnut_prop_scene.instantiate()
			add_child(new_wallnut_instance)
		"PeashooterSelectionItem":
			pass
