extends RigidBody2D

export (int) var Vmax
export (int) var Vmin
var las_copas = ["AMERICA", "MUNDO"]

func _ready():
	$SpriteCopa.animation = las_copas[randi() % las_copas.size()]
	
	if $SpriteCopa.animation == "MUNDO":
		$ColisionCopa.scale.y = 1.5
		



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
