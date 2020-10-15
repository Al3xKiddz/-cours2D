extends KinematicBody2D
export (PackedScene) var smoll
var speed = 200
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
		get_node("../vaisseau").pts += 10
		get_node("../vaisseau").nbass -= 1
		for i in 2:
			var sm = smoll.instance()
			sm.position.x = position.x 
			sm.position.y =position.y
			get_parent().add_child(sm)
		queue_free()
		print("bye assssssteroid")
