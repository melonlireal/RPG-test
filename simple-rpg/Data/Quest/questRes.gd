extends Resource
class_name QuestRes
@export var quest_title: String = "title"
@export_multiline var quest_desc:String = "aaa"
@export var require_items: Dictionary[ItemRes, int] = {}
@export var reward_items:Dictionary[ItemRes, int] = {}
