extends Sprite2D

var round_counter = 1
var initial_time = 10

var zombie_scene = preload("res://scenes/zombie.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass
func spawn_zombie():
	var zombie = zombie_scene.instantiate()
	$ZombieHolder.add_child(zombie)
func some_zombie():
	var zombie = zombie_scene.instantiate()
	remove_child(zombie)

func _on_start_timeout() -> void:
	new_round(initial_time)

func new_round (time):
	for i in round_counter:
		spawn_zombie()
	$Round_lenght.start(time)
	show_round_HUD()
	round_counter += 1

func _on_round_lenght_timeout() -> void:
	for i in $ZombieHolder.get_children():
		i.queue_free()
	new_round(initial_time + round_counter*3)
	pass

func show_round_HUD():
	$HUD/Round.text = str("%d" %round_counter)
