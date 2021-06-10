extends Actor

#var screen_size

#func _ready():
	#hide()
#	screen_size = get_viewport_rect().size

func start(pos):
	# Set the start position for every new game
	position = pos

func _process(delta):
	_velocity = Vector2.ZERO
	# Translate input to _velocity
	if Input.is_action_pressed("ui_right"):
		if _velocity == Vector2.ZERO:
			_velocity.x = 1
	if Input.is_action_pressed("ui_left"):
		if _velocity == Vector2.ZERO:
			_velocity.x = -1
	if Input.is_action_pressed("ui_down"):
		if _velocity == Vector2.ZERO:
			_velocity.y = 1
	if Input.is_action_pressed("ui_up"):
		if _velocity == Vector2.ZERO:
			_velocity.y = -1
	
	# Calculate _velocity and handle the animation
	if _velocity.length() > 0:
		_velocity = _velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	
	# Set the new position based on _velocity
	position += _velocity * delta
	
	# Restrict the position to a specified range (screen size)
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
	
	# Change sprite based on direction
	if _velocity.x < 0:
		$AnimatedSprite.animation = "left"
	if _velocity.x > 0:
		$AnimatedSprite.animation = "right"
	if _velocity.y < 0:
		$AnimatedSprite.animation = "up"
	if _velocity.y > 0:
		$AnimatedSprite.animation = "down"
