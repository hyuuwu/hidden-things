extends Node2D

@onready var label: RichTextLabel = $RichTextLabel
@onready var sfx: AudioStreamPlayer = $AudioStreamPlayer
@onready var timerorsmth: Timer = $timesmthsmthssd
var _typing_id: int = 0

func type_text(full_text: String, delay: float = 0.03) -> void:
	_typing_id += 1
	var current_id := _typing_id

	label.text = full_text
	label.visible_characters = 0

	var parsed_text := label.get_parsed_text()
	var total_chars := parsed_text.length()

	for i in range(total_chars):
		# Se outra chamada começou, aborta este loop imediatamente
		if current_id != _typing_id:
			return

		label.visible_characters = i + 1
		var ch := parsed_text[i]
		if ch not in [" ", "\n", ".", ",", "!", "?"]:
			sfx.pitch_scale = randf_range(0.92, 1.08)
			sfx.play()

		await get_tree().create_timer(delay).timeout
func _ready() -> void:
	await type_text("In a very, very small town away...", 0.06)
	await get_tree().create_timer(1.5).timeout
	await type_text("There was you. The Player.", 0.06)
	await get_tree().create_timer(3).timeout
	await type_text("You always wanted to get the hidden itens thru your city...", 0.06)
	await get_tree().create_timer(0.9).timeout
	await type_text("But you Couldn't.", 0.06)
	await get_tree().create_timer(2).timeout
	await type_text("Today is a new day. Maybe You'll find it.", 0.06)
	await get_tree().create_timer(2).timeout
	$Button.show()



func _on_button_pressed() -> void:
	Autolod.init_data["skip_cutscen"] = 1
	Autolod.save_game()
	get_tree().change_scene_to_file("res://maingame.tscn")

	
