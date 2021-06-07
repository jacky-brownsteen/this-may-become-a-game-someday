extends Area2D

export var speed = 300
var screen_size

func _ready():
	#hide()
	screen_size = get_viewport_rect().size

#func start(pos):
	# Set the start position for every new game
#	position = pos
#	show()

func _process(delta):
	# Movement vector
	var velocity = Vector2()
	
	# Translate input to velocity
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	# Calculate velocity and handle the animation
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	# Set the new position based on velocity
	position += velocity * delta
	
	# Restrict the position to a specified range (screen size)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	# Change sprite based on direction
#	if velocity.x != 0:
#		$AnimatedSprite.animation = "walk"
#		$AnimatedSprite.flip_v = false
#		$AnimatedSprite.flip_h = velocity.x < 0
#	if velocity.y < 0:
#		$AnimatedSprite.animation = "up"
#	if velocity.y > 0:
#		$AnimatedSprite.animation = "down"
