class_name PlayerMove
extends PlayerState

func onTick(player: Player, _delta: float) -> void:
	if Input.is_action_just_pressed("Attack"):
		player.changeState(player.attack_state)
		return
	var dir: Vector2 = player.getDir()
	if dir == Vector2.ZERO:
		player.velocity = Vector2.ZERO
		player.changeState(player.idle_state)
		return
	player.velocity = dir * player.SPEED
	player.move_and_slide()
