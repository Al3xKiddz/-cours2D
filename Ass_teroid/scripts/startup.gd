extends Control


onready var menu = get_node("../Node2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	menu.visible = false
	visible = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	menu.visible = true
	visible = false
	pass
