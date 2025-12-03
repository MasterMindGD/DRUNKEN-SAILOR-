extends CharacterBody2D
#
#func _ready(): 
##Parallax: 
	#if Input.is_action_pressed("izquierda") 
		#position.x = +1 
		#
	#elif Input.is_action_pressed("derecha"): 
		#position.x = -1 
	#
	#else: 
		#position.x = +0 
