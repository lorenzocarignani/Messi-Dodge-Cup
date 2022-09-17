extends Area2D
export (int) var velocidad
var movimiento = Vector2()
var limite
signal golpe
export (float) var enfriamiento


func _ready():
	hide()
	limite = get_viewport_rect().size

func _process(delta):
	movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	if Input.is_action_pressed ("ui_left"):
		movimiento.x -= 1
	if Input.is_action_pressed ("ui_up"):
		movimiento.y -= 1
	if Input.is_action_pressed ("ui_down"):
		movimiento.y += 1
	if movimiento.length() > 0:
		movimiento = movimiento.normalized() * velocidad
	
	
	position += movimiento * delta
	position.x = clamp(position.x , 0, limite.x)
	position.y = clamp (position.y, 0 , limite.y)
	
	if movimiento.x != 0:
		$Sprite.animation = "LADO"
		$Sprite.flip_h = movimiento.x < 0
	elif movimiento.y < 0:
		$Sprite.animation = "ARRIBA"
	elif movimiento.y  > 0:
		$Sprite.animation = "ABAJO"
	else:
		$Sprite. animation = "FRENTE"


func _on_MESSI_body_entered(body):
	hide()
	emit_signal("golpe")
	$Colision.set_deferred("disabled", true)
	
func _inicio(pos):
	position = pos
	show()
	$Colision.disabled = false


func _on_Sprint_timeout():
	if Input.is_action_pressed("Sprint"):
		velocidad = velocidad+200
