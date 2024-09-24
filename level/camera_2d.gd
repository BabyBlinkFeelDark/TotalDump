extends Camera2D
@onready var player = $"../Player"
var scope_l:int

func _ready() -> void:

	set_process(true)
	$Label.set_text("Scope 0")

func _process(delta: float) -> void:
	scope_l=(player.scope*-1)/100
	if player.global_position.y < global_position.y:
		global_position = Vector2(720/2,player.global_position.y)
	if scope_l>0:
		$Label.set_text("Scope %s" % scope_l)
	pass
