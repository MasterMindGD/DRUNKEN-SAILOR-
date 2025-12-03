class_name Monedero   
extends Node

var _total_monedas: int 
var _monedas_recogidas: int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var monedas := get_children() 
	_total_monedas = monedas.size() 
	
	for moneda in monedas: 
		moneda.monedero = self 

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func moneda_recogida(): 
	_monedas_recogidas += 1 
	
	if _monedas_recogidas == _total_monedas: 
		print("NIVEL SUPERADO!") 
		
