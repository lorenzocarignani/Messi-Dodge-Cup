extends Node
export (PackedScene) var Copas
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$MESSI._inicio($posicionDeInicio.position)
	$InicioTimer.start()
	$Interfaz.Mostrar_mensaje("Listo!")
	$Interfaz.updatescore(Score)

func game_over():
	$ScoreTimer.stop()
	$CopaTimer.stop()
	$Interfaz.game_over()



func _on_InicioTimer_timeout():
	$CopaTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.updatescore(Score)


func _on_CopaTimer_timeout():
	
	
	$camino/CopaPosicion.set_offset(randi())
	
	var C = Copas.instance()
	add_child(C)
	
	var D = $camino/CopaPosicion.rotation + PI/2
	
	C.position = $camino/CopaPosicion.position
	
	D += rand_range(-PI /4, PI/4)
	C.rotation = D
	C.set_linear_velocity(Vector2(rand_range(C.Vmin, C.Vmax), 0).rotated(D))
	
	
	
	
