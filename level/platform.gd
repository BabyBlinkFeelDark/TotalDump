extends CharacterBody2D
@onready var player = $"../Player"

const SPEED = 10.0
func _process(delta: float) -> void:

	if player.global_position.y>position.y-40:
		$CollisionShape2D.disabled=true
	else:
		$CollisionShape2D.disabled=false
		
func _physics_process(delta: float) -> void:
	var player_y = -1 * player.global_position.y
	var plat_y = -1 * position.y
	if player_y-plat_y>800:
		queue_free()

	move_and_collide(Vector2.DOWN*SPEED * delta)
