extends StaticBody2D

var window_height : int
var window_width : int
var p_height : int
var p_width : int
var player_speed = 500



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_height = get_viewport_rect().size.y
	window_width = get_viewport_rect().size.x
	p_height = $ColorRect.get_size().y
	p_width = $ColorRect.get_size().x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	
