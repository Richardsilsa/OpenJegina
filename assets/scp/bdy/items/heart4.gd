extends Area2D

func ready():
	$CollisionPolygon2D.disabled = false
	$AnimationPlayer.play("normal")

func _on_heart2_body_entered(body):
	if body.name == 'Player':
		body.lifeop(2)
	$AnimationPlayer.play("dissapear")
	$Light2D.hide()
