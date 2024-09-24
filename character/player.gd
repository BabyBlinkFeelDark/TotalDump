
extends CharacterBody2D

const PLATFORM_SCENE = preload("res://level/platform.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -800.0
@onready var anim = $AnimatedSprite2D
@onready var cam = $"../Camera2D"
var canSpawn: bool
var rng = RandomNumberGenerator.new()
var scope:int = 2000

func _physics_process(delta: float) -> void:

		
	if global_position.x>720:
		global_position.x = 0
	elif global_position.x<0:
		global_position.x = 720
	var my_random_number = rng.randf_range(0, 1)

	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if scope>global_position.y:
			scope = global_position.y
			print(scope*-1/100)
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")

	if direction:
	
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/10)
	
	if direction == -1:
		anim.flip_h=true

	elif direction == 1:
		anim.flip_h=false

	if cam.global_position.y+(1280/2)<global_position.y:
		print("lose")
		get_tree().change_scene_to_file("res://menu.tscn")



	move_and_slide()



	
