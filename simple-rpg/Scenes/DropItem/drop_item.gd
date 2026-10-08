extends Area2D
class_name DropItem

@onready var sprite: Sprite2D = $Sprite
@onready var item_name: Label = $ItemName

@export var item_res:ItemRes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = item_res.icon
	item_name.text = item_res.name


func pickup():
	await ItemManager.add_item(item_res)
	queue_free()
