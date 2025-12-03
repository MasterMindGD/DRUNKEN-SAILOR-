extends RigidBody2D

@export var raycast: RayCast2D 

func _physics_process(_delta: float) -> void: 
#	if raycast.get_collider() != null: 
	if raycast.get_collider(): #La aclaración anterior es redundante. Hacer un if de cualquier cosa que pueda ser null, devuelve false si es null y true si no lo es.  
		await get_tree().create_timer(0.25).timeout #Alternativamente resume el Timer anterior.
		freeze = false 
