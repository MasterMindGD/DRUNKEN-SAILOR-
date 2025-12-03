extends Node2D 
 
#@export var nivel_1: PackedScene 
@export var niveles: Array [PackedScene] 

var _nivel_actual: int = 1 
var _nivel_instanciado: Node 

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	pass 
#	add_to_group()"personajes") #Interactúa con el instanciado de Niveles. 
	#_crear_nivel(_nivel_actual) #Interactúa con el instanciado de Niveles. 

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

#Inicialización de siguiente Nivel: 
func _crear_nivel(numero_nivel:int): #Interactúa con el instanciado de Niveles. 
	#niveles[0].instantiate() 
	_nivel_instanciado = niveles[numero_nivel - 1].instantiate() #Alternativamente a lo anterior. 
	add_child(_nivel_instanciado) 
	
#	var hijos = _nivel_instanciado.get_children() #Esta versión devuelve un Array. 
	var hijos = _nivel_instanciado.get_children() #Ante la duda, hace que esta Var sea del Tipo de Dato que te meta... 
#	for i in 10: #Haría que el Código que escribamos dentro del for se reitere 10 veces.  
	for i in hijos.size(): #Hace que el Código que escribamos dentro del for se reitere *la cantidad de Hijos en el Array = veces. 
			if hijos[i].is_in_group("personajes"): 
				hijos[i].personaje_muerto.connect(_reiniciar_nivel) 
				break 

	var _personajes := get_tree().get_nodes_in_group("personajes") #alternativamente reemplaza al for anterior. 
#Esto automáticamente recorre todo el Árbol de Nodos buscando a los del Grupo "personajes" y nos lo devuelve en un Array. 
#personajes[0].personaje_muerto.connect(_reiniciar_nivel) 

func _eliminar_nivel():
	_nivel_instanciado.queue_free() 
	
func _reiniciar_nivel(): 
	_eliminar_nivel() 
	_crear_nivel.call_deferred(_nivel_actual) 
	
	

	
	
	
