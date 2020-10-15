extends Node2D
export var width = 1024
export var height = 600
export (PackedScene) var thicc 
export (PackedScene) var mediumSaignant
var rand = RandomNumberGenerator.new()
onready var screen_size = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 10:
		onspawntimertimeout()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_node("vaisseau").nbass == 1):
		for i in 3:
			onspawntimertimeout()
		get_node("vaisseau").nbass = 10
	pass

func onspawntimertimeout() -> void:
	randomize()
	var platforms = [thicc, mediumSaignant]
	var platform = platforms[randi() % platforms.size()]
	var object = platform.instance()
	print (object)
	rand.randomize()
	var x = rand.randf_range(0, screen_size.x)
	rand.randomize()
	var y = rand.randf_range(0, screen_size.y)
	object.position.x = x
	object.position.y = y
	add_child(object)
