extends KinematicBody2D
var width = 1024
var height = -600
var vitesse = 100
var velociter = Vector2()
var helt = 3
var pts = 0
var nbass = 10
export (PackedScene) var balle
onready var screen_size = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_input()
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	var dir = get_global_mouse_position() - global_position
	rotation = dir.angle()
	velociter = move_and_slide(velociter)
	get_node("../vies").text = "Vies: " + str(helt)
	get_node("../pts").text = "Pts: " + str(pts)
	var collision = move_and_collide(velociter * delta)
	if collision:
		print("colliser visso")
		if collision.collider.has_method("hit"):
			print("hit de meteorite")
			helt -=1
			collision.collider.hit(collision)
			position.x = 512
			position.y = 300
			en_vie()
			get_node("CollisionShape2D").set_deferred("disabled",true)
			yield(get_tree().create_timer(2.0),"timeout")
			get_node("CollisionShape2D").set_deferred("disabled",false)
func _get_input():
	var avance = Input.is_action_pressed("ui_up")
	var tiration = Input.is_action_just_pressed("ui_accept")
	if avance:
		velociter = Vector2(vitesse,0).rotated(rotation)
	if tiration:
		tirer()
	
func tirer():
	var b = balle.instance()
	b.start($pitcheur.global_position, rotation)
	get_parent().add_child(b)
	
func en_vie():
	if helt <= 0:
		print("meur")
		get_tree().change_scene("res://scenes/Node2D.tscn")
