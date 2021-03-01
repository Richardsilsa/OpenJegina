extends Control

func _ready():
	$CenterContainer/AnimatedSprite.play("start")
	get_tree().change_scene("res://assets/scn/lvl/N-ull.tscn")
	print("scenechanged")

