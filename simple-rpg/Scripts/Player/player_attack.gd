class_name PlayerAttack
extends PlayerState

func onEnter(player: Player) -> void:
	player.attack_timer = player.ATTACK_TIME
	player.attack_box = player.getHitBox()
	player.attack_box.monitoring = true
	player.attack_box.visible = true

func onExit(player: Player) -> void:
	player.clearHitBox()

func onTick(player: Player, delta: float) -> void:
	player.velocity = Vector2.ZERO
	player.attack_timer -= delta
	if player.attack_timer <= 0.0:
		player.changeState(player.idle_state)
