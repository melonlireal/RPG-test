class_name PlayerIdle
extends PlayerState

func onTick(player: Player, _delta: float) -> void:
	if Input.is_action_just_pressed("Attack"):
		player.changeState(player.attack_state)
		return
	if player.getDir() != Vector2.ZERO:
		player.changeState(player.move_state)
