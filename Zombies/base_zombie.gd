extends CharacterBody2D
class_name Zombie

# FIXME TODO Make plant_eaten emit when eaten a plant

@export var health := 10
@export var acceleration := 25.0
@export var speed_limit := 2250.0
@onready var zombie_sprite: Sprite2D = %Sprite2D

var current_speed :float
var move_direction := -1
var slow_down := false
#var walk_delay := 1

func _ready() -> void:
	Events.bullet_hit.connect(take_damage)
	zombie_sprite.modulate = Color(1, 1, 1)

func _physics_process(delta: float) -> void:
	walk(delta)
	move_and_slide()
	#modulate = Color(1, 1, 1)

func walk(delta: float) -> void:
	velocity.x = move_direction * current_speed * delta

	# Moving if the zambie hasn't reached the speed limit. When it has, it goes into slowing down mode.
	if current_speed <= speed_limit and !slow_down:
		current_speed += acceleration
	else:
		slow_down = true
	if slow_down:
		current_speed -= acceleration * 2
		if current_speed <= 2:
			slow_down = false
			current_speed = 0

func take_damage(thing_that_got_hit: String) -> void:
	if thing_that_got_hit == name:
		zombie_sprite.modulate = Color(1.5, 1.5, 1.5)
		health -= 1
		if health <= 0:
			queue_free()
		await get_tree().create_timer(0.225).timeout
		zombie_sprite.modulate = Color(1, 1, 1)

# FIXME TODO Make plant_eaten emit when eaten a plant
