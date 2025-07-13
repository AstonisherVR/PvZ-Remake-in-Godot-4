extends Area2D
class_name PeaBullet

@onready var stop_existing_timer: Timer = %StopExistingTimer
@onready var visible_notifier: VisibleOnScreenNotifier2D = %VisibleNotifier2D
@export var pea_speed := 300.0
var direction := Vector2.RIGHT

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move(delta)

func move(delta: float) -> void:
	position += direction * pea_speed * delta

func _on_visible_notifier_2d_screen_exited() -> void:
	stop_existing_timer.start(0.8)

func _on_stop_existing_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	_hit(body)

func _hit(thing_that_got_hit: Node2D) -> void:
	Events.bullet_hit.emit(thing_that_got_hit.name)
	queue_free()
