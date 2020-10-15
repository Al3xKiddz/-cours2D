extends KinematicBody2D
export (PackedScene) var mediumSaignant
var speed = 150
var velocity = Vector2()
onready var screen_size = get_viewport_rect().size
func _ready():
	randomize()
	var angle = rand_range(0,359)
	velocity = Vector2(speed, 0).rotated(deg2rad(angle))

func _process(delta):
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	move_and_collide(velocity * delta)

func hit(collision):
	if collision :
		get_node("../vaisseau").pts += 15
		get_node("../vaisseau").nbass -= 1
		for i in 2:
			var med = mediumSaignant.instance()
			med.position.x = position.x 
			med.position.y =position.y
			get_parent().add_child(med)
		queue_free()
		print("bye asssteroid")
