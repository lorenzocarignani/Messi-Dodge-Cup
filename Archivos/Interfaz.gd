extends CanvasLayer
signal inicar_juego

func Mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	

func game_over():
	
	Mostrar_mensaje("Pecho frio!")
	yield($MensajeTimer, "timeout")
	$Button.show()
	$Mensaje.text = "¿De nuevo?"
	$Mensaje.show()

func updatescore(Puntos):
	$ScoreLabel.text = str(Puntos)
	

func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("inicar_juego")
