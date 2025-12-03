class_name Inventario  
extends Node

var _total_items: int 
var _items_recogidos: int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var items := get_children() 
	_total_items = items.size() 
	
	for item in items: 
		item.inventario = self 

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func item_recogido(): 
	_items_recogidos += 1 
	
	if _items_recogidos == _total_items: 
		print("LO ENCONTRASTE!") 
		
