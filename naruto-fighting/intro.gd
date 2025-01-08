extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Call the animation sequence using await
	start_animations()

# Function to handle the animations and timers
func start_animations() -> void:
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(3).timeout


	get_tree().change_scene_to_file("res://MainMenu.tscn")
