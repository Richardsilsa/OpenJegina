extends KinematicBody2D

## Anoying variables
var Down = Vector2(0,-1)

## "Constants" Variables
var Speed = Vector2(16,256)
var SpeedLM = 4 ## Speed Loss multiplayer
var MaxSpeed = Vector2(160,256) ## The speed loss may only work well with multiples of 8
var Gravity = 16

## Actual variables
var Move = Vector2()

func _physics_process(_delta):

# warning-ignore:return_value_discarded
	move_and_slide(Move)
## Like this i can easily change the way that the character moves

## Gravity
	if $Feet.is_colliding() == false :
		Move.y += Gravity

	if Input.is_action_pressed("ui_right") and Move.x < MaxSpeed.x :
		Move.x += Speed.x
	if Input.is_action_pressed("ui_left") and Move.x > -MaxSpeed.x :
		Move.x -= Speed.x

	if Input.is_action_pressed("ui_jump") and $Feet.is_colliding() == true :
		Move.y = -Speed.y

#Stopper#
	elif Move.x > 0:
		Move.x -= Speed.x/SpeedLM
	elif Move.x < 0:
		Move.x += Speed.x/SpeedLM
