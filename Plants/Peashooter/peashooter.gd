extends Area2D
class_name Peashooter

@onready var shootpoint: Marker2D = %Shootpoint
@onready var shoot_timer: Timer = %ShootTimer
@export var fire_rate := 1.0
#var can_fire := true

func _ready() -> void:
	#shoot_timer.connect("timeout", set_can_fire)
	shoot_timer.wait_time = 2 / fire_rate
	shoot_timer.start()

#func set_can_fire() -> void:
	#can_fire = true

func shoot() -> void:
	const PEA_BULLET = preload("res://Plants/Projectiles & Stuff/pea.tscn")
	var new_pea_bullet := PEA_BULLET.instantiate() as PeaBullet
	new_pea_bullet.global_position = shootpoint.global_position
	shootpoint.add_child(new_pea_bullet)

func _on_shoot_timer_timeout() -> void:
	shoot()
	shoot_timer.start()
