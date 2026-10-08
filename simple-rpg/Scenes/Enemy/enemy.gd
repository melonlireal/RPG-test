extends CharacterBody2D
class_name Enemy
@export var enemy_res: EnemyRes

@onready var enemy_name: Label = $EnemyName

var health: int = 1


func _ready() -> void:
	health = enemy_res.enemy_health
	enemy_name.text = enemy_res.enemy_name
	
func get_hit(damage: int):
	print("I get hit!")
	health -= damage
	if health <= 0:
		die()
	print(health)
	
func die():
	var drop = randf() <= enemy_res.drop_chance
	if drop:
		var item:DropItem = load("res://Scenes/DropItem/drop_item.tscn").instantiate()
		item.item_res = enemy_res.drop_item
		item.global_position = self.global_position
		get_parent().add_child(item)
	queue_free()
	
