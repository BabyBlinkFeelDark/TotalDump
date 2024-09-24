extends Node2D

const PLATFORM_SCENE = preload("res://level/platform.tscn")
@onready var player = $Player
var y = 1000

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:

	while y > player.global_position.y*10:
		var platform = PLATFORM_SCENE.instantiate()
		platform.global_position = (Vector2(randi_range(200,720),y))
		add_child(platform)
		y-=randi_range(200,300)
	
