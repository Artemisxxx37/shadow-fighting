extends Node2D

func _ready():
	# Ensure both sprites are visible
	$Sprite.visible = true 

	# Set Z-index to control drawing order
	$Sprite.z_index = 0


	# Modify button colors and styles
	set_button_styles()

	# Connect buttons to functions
	$Control/StartButton.connect("pressed", self, "_on_StartButton_pressed")
	$Control/QuitButton.connect("pressed", self, "_on_QuitButton_pressed")

	# Play background music
	$AudioStreamPlayer.play()

	# Call the animation sequence using yield
	start_animations()

func start_animations():
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(3).timeout

	get_tree().change_scene_to_file("res://YourGameScene.tscn")

func set_button_styles():
	var start_button = $Control/StartButton
	var quit_button = $Control/QuitButton

	# Change text color
	var font_color = Color(1, 0, 0)  # Red color
	start_button.add_color_override("font_color", font_color)
	quit_button.add_color_override("font_color", font_color)
	
	# Change background color
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = Color(0, 0, 1)  # Blue color
	start_button.add_stylebox_override("normal", stylebox)
	quit_button.add_stylebox_override("normal", stylebox)

func _on_StartButton_pressed():
	get_tree().change_scene("res://YourGameScene.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
