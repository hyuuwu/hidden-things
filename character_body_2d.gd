extends CharacterBody2D

@export var speed: float = 100
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var last_dir: String = "down"

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	
	update_animation(direction)

func update_animation(dir: Vector2) -> void:
	if dir == Vector2.ZERO:
		anim.play("idle_" + last_dir)
		return

	if abs(dir.x) > abs(dir.y):
		last_dir = "side"
		anim.flip_h = dir.x < 0
	else:
		last_dir = "down" if dir.y > 0 else "up"
		anim.flip_h = false

	anim.play("walk_" + last_dir)


func _on_interactablepart_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
