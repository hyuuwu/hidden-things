extends CanvasLayer

@onready var fade_rect: ColorRect = $FadeRect
var is_transitioning: bool = false

func change_scene(target_scene_path: String, duration: float = 0.4) -> void:
	if is_transitioning:
		return
	is_transitioning = true
	
	# Fade to black
	var tween := create_tween()
	tween.tween_property(fade_rect, "color:a", 1.0, duration)
	await tween.finished
	
	# Switch the scene
	get_tree().change_scene_to_file(target_scene_path)
	
	# Fade back in
	var fade_in := create_tween()
	fade_in.tween_property(fade_rect, "color:a", 0.0, duration)
	await fade_in.finished
	
	is_transitioning = false
