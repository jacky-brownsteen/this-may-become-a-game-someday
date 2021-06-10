extends Node2D

func _ready():
	$Player/Music.play()
	$Player.start($StartPosition.position)
