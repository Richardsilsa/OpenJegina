extends KinematicBody2D

######Constants######
var down = Vector2(0,-1)
var speed = 300
var grav = 3
var delay = 10

######Variables######
var cana = 1
var direction
var flip
var curanim
var vel = Vector2()

func ready():
	curanim = 0

func _physics_process(delta):

	move_and_slide(vel,down)

###PhysicsMovement ###
	if not is_on_floor():
		vel.y = vel.y + grav
	elif vel.y > 0 and is_on_floor():
		vel.y = 0
	
	if direction == 1:
		vel.x = speed
		flip = 1
	elif direction == -1:
		vel.x = -speed
		flip = -1
	elif vel.x > 0:
		vel.x = vel.x - delay
	elif vel.x < 0:
		vel.x = vel.x + delay
	
	if not vel.y == 0:
		direction = 0
###Animator###
	if curanim == 1 and vel.x == 0:
		$AnimationPlayer.play("appear")
	if curanim == 1:
		$AnimatedSprite.play("walk")
		$AnimationPlayer.play("attack")
	if curanim == 0 and vel.x == 0:
		$AnimatedSprite.play("idle")
		$AnimationPlayer.play("still")
	if flip == -1:
		$AnimatedSprite.flip_h = true
	if flip == 1:
		$AnimatedSprite.flip_h = false
	if vel.x > 10 or vel.x < -10:
		curanim = 1
	
	if vel.x == 0:
		curanim = 0
	
	if cana == 0 and vel.x == 0 and vel.x == 0:
		$AnimationPlayer.play("die")
func _on_detectorl_body_entered(body):
	if body.name == 'Player':
		direction = -1
		flip = -1
		cana = 0

func _on_detectorr_body_entered(body):
	if body.name == 'Player':
		direction = 1
		flip = 1
		cana = 0

func _on_pdetectorr_body_entered(body):
	if body.name == 'MainMap':
		direction = 0
	if body.name == 'Player':
		body.gethit2()
		$CollisionPolygon2D.disabled == true
		body.pullru()

func _on_pdetectorl_body_entered(body):
	if body.name == 'MainMap':
		direction = 0
	if body.name == 'Player':
		body.gethit2()
		$CollisionPolygon2D.disabled == true
		body.pulllu()
