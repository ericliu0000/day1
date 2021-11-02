extends KinematicBody2D

var vel = Vector2(0, 0)
var acc = 1500
export var jump_str = 300
var mg = 500
var speed_lim = 420
var friction = 0.08
var health = 100

var multi_jump = 13
var score = 0

onready var sprite = $Sprite
onready var yeet = $lebel

func _ready():
	pass

func _physics_process(delta):
	var x_i = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	vel.x += acc * x_i * delta
	vel.x = clamp(vel.x, -speed_lim, speed_lim)
	
	sprite.flip_h = (x_i < 0)
	
	vel.x = lerp(vel.x, 0, friction)
	
	if is_on_floor():
		multi_jump = 13
		
	if multi_jump and Input.is_action_just_pressed("ui_up"):
		multi_jump -= 1
		vel.y = -jump_str
		
	vel.y += mg * delta
	
	vel = move_and_slide(vel, Vector2.UP)
	
	
	# yeet.set_text(str(pos.x))
	


func _on_hortbot_area_entered(_area):
	health = health - 1
	yeet.set_text("hp=" + str(health) + " score=" + str(score))
	vel.y = -90
