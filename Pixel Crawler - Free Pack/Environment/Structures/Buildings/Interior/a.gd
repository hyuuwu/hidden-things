extends Area2D

@export var interact_name: String = "Interact"
@export var is_interactable: bool = true
var interact: Callable = func(): pass

func trigger() -> void:
	if is_interactable and interact.is_valid():
		interact.call()
