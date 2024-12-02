extends CharacterBody2D

var window_height : int
var window_width : int
var p_height : int
var p_width : int
var player_speed = 400



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window_size()
	get_player_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_moviment(delta)


func player_moviment(delta) :
	if Input.is_action_pressed("ui_up"):
		position.y -= player_speed * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += player_speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= player_speed * delta
	elif Input.is_action_pressed("ui_right"):
		position.x += player_speed * delta
	position.y = clamp(position.y, p_height / 2, window_height - p_height / 2)
	position.x = clamp(position.x, p_width / 2, window_width -  p_width / 2)
func get_window_size() :
	window_height = get_viewport_rect().size.y
	window_width = get_viewport_rect().size.x
func get_player_size() :
	p_height = $ColorRect.get_size().y * $".".scale.y
	p_width = $ColorRect.get_size().x * $".".scale.x
