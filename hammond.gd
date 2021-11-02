extends KinematicBody2D

export var accel = 50
export var friction = 0.2
export var gravity = 5

onready var sprite = $AnimatedSprite
onready var roomba = $flore
onready var wal_hit = $woll

var velocity = Vector2.ZERO
var direction = -1

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = accel * direction
	
	sprite.flip_h = (direction != -1)
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
	if !roomba.is_colliding() or wal_hit.is_colliding():
		direction = -direction
		wal_hit.cast_to.x *= -1
		roomba.position.x *= -1
