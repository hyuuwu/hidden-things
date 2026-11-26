extends Area2D

@export_file("*.tscn") var next_scene: String = ""
# log 26/11/26: removed dbugin
var player_in_range: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	#print("Entered area: ", body.name, " | In player group: ", body.is_in_group("player"))
	if body.is_in_group("player"):
		player_in_range = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		#print("Interact pressed! In range: ", player_in_range, " | Next scene: ", next_scene)
		if player_in_range and next_scene != "":
			SceneTransition.change_scene(next_scene)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false

#func _unhandled_input(event: InputEvent) -> void:
	#if player_in_range and event.is_action_pressed("interact"):
		#if next_scene != "":
			#SceneTransition.change_scene(next_scene)
