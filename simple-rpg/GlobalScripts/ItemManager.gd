extends Node

var owned_items: Dictionary[ItemRes, int] = {}

func add_item(item: ItemRes):
	if item not in owned_items:
		owned_items[item] = 0
	owned_items[item] += 1
	print(owned_items)
