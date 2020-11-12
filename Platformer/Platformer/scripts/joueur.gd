extends KinematicBody2D

const speed = 300
var velocity = Vector2()
export var gravity = 2000
export var impulsion = -700
var is_jumping = false
onready var coeursderockeurs = $coeurs
export(int) var current_frame
var helth = null
func _ready():
	helth = 3
	pass
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("droite"):
		velocity.x += speed
		
	if Input.is_action_pressed("gauche"):
		velocity.x -= speed
		
	if Input.is_action_just_pressed("ui_select") and !is_jumping and is_on_floor():
		is_jumping = true
		velocity.y = impulsion
func _physics_process(delta):
	get_input()
	if helth == 3:
		current_frame = 0
	elif helth == 2:
		current_frame = 1
	elif helth == 1:
		current_frame = 2
	elif helth == 0:
		print ("pu de vies")
		current_frame = 3
		get_tree().change_scene("res://scenes/Died.tscn")
	coeursderockeurs.frame = current_frame
	velocity.y += gravity * delta
	if is_jumping and is_on_floor():
		is_jumping = false
	velocity = move_and_slide(velocity,Vector2(0,-1))
