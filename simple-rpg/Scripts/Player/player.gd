extends CharacterBody2D
class_name Player

const SPEED: float = 120.0
const ATTACK_TIME: float = 0.3
const ATTACK_DAMAGE: int = 1

@onready var left: Area2D = $HitBox/left
@onready var right: Area2D = $HitBox/right
@onready var up: Area2D = $HitBox/up
@onready var down: Area2D = $HitBox/down
@onready var pick_box: Area2D = $PickBox

var idle_state: PlayerState = PlayerIdle.new()
var move_state: PlayerState = PlayerMove.new()
var attack_state: PlayerState = PlayerAttack.new()
var state: PlayerState = idle_state
var facing: Vector2 = Vector2.DOWN
var attack_timer: float = 0.0
var attack_box: Area2D = null

func _ready() -> void:
	for box: Area2D in [left, right, up, down]:
		box.area_entered.connect(_onHit)
	pick_box.area_entered.connect(_onPick)

func _onHit(area: Area2D) -> void:
	if area.owner is Enemy:
		area.owner.get_hit(100)

func _onPick(area: Area2D) -> void:
	if area is DropItem:
		area.pickup()

func _physics_process(delta: float) -> void:
	updateFacing()
	state.onTick(self, delta)

func updateFacing() -> void:
	if Input.is_action_just_pressed("left"):
		facing = Vector2.LEFT
	elif Input.is_action_just_pressed("right"):
		facing = Vector2.RIGHT
	elif Input.is_action_just_pressed("up"):
		facing = Vector2.UP
	elif Input.is_action_just_pressed("down"):
		facing = Vector2.DOWN

func changeState(new_state: PlayerState) -> void:
	if new_state == state:
		return
	state.onExit(self)
	state = new_state
	state.onEnter(self)

func getDir() -> Vector2:
	var dir: Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	return dir.normalized()

func clearHitBox() -> void:
	for box: Area2D in [left, right, up, down]:
		box.monitoring = false
		box.visible = false
	attack_box = null

func getHitBox() -> Area2D:
	if facing == Vector2.LEFT:
		return left
	if facing == Vector2.RIGHT:
		return right
	if facing == Vector2.UP:
		return up
	return down
