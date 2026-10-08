extends Resource
class_name EnemyRes
@export var enemy_name: String = "temp"
@export var enemy_health: int = 10

@export var drop_item:ItemRes
@export_range(0, 1.0, 0.05) var drop_chance: float = 0.2
