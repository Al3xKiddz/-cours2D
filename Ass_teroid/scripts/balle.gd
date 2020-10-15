extends KinematicBody2D


var speed = 500
var velo = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	velo = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velo * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(collision)
			_on_VisibilityNotifier2D_screen_exited()
		velo = velo.bounce(collision.normal)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
