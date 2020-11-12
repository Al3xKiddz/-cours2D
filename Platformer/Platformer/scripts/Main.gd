extends Node2D

#salut fred


func _ready():
	pass

func _on_Area2D_body_entered(body):
	print("ca marche")
	var player = get_node("Node2D11")
	player.helth -= 1
	player.position.x = -162
	player.position.y = 300


func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://scenes/winner.tscn")
