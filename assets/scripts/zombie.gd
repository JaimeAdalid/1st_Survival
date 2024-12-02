extends CharacterBody2D

var window_size : Vector2
const START_SPEED : int = 200
const ACCEL : int = 25
var speed : int
var dir : Vector2
var running = 0 #To avoid zombies spawning and killing the player

func _ready() -> void:
	window_size = get_viewport_rect().size
	new_zombie()

func new_zombie():
	running = 0
	position.x = randi_range(0, window_size.x)
	position.y = randi_range(0, window_size.y)
	speed = START_SPEED

func zombie_start():
	dir = random_direction()

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1,-1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()

func _physics_process(delta: float) -> void:
	collision_behavior(delta)

func collision_behavior(delta) :
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		dir = dir.bounce(collision.get_normal())
		collider = collision.get_collider()
		if collider == $"../../Borders" and running == 1:
			speed += ACCEL
		if collider == $"../../Player" and running == 1: 
			get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	zombie_start()


func _on_time_to_kill_timeout() -> void:
	running = 1
