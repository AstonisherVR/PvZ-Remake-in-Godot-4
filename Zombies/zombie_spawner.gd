extends Node
class_name ZombieSpawner

@onready var spawn_timer: Timer = %SpawnTimer
const ZOMBIE_SCENES: Array[PackedScene] = [preload("res://Zombies/angry_zombie.tscn"), preload("res://Zombies/base_zombie.tscn")]

func _ready() -> void:
	spawn_timer.timeout.connect(spawn_zombie)
	start_spawning_zombies()

func spawn_zombie() -> void:
	var new_zombie: PackedScene = ZOMBIE_SCENES.pick_random() #as Zombie
	var new_zombie_instance := new_zombie.instantiate() as Zombie
	add_sibling(new_zombie_instance)
	new_zombie_instance.position = Vector2(600, 600)
	#TODO Fix
	#new_zombie_instance.global_position = Globals.grid_positions

func start_spawning_zombies() -> void:
	spawn_timer.start()

func stop_spawning() -> void:
	spawn_timer.stop()
