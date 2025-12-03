extends CharacterBody2D #habilita al Script a procesar las Propiedades de esta clase de Nodo. 
#Ejemplo: 
#func ready(): 
	#slide-on-ceiling = false 

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()


#Trackers: 
var vidas: int = 3 
var monedas = null 
var rum = null
var grog = null
var pata_pollo = null 
var espada: bool = false 
var pistola: bool = false 
var llave: bool = false 
var tiempo_restante: float = 2.42 

var ebrio: bool = false 
#var ebrio: bool = true 

#Texto en Pantalla: 
#var sentencia: String = "Only a pardon letter from the Governor can save his neck..." 
#var start: String = "READY? 2... 1!" 
#var lyrics: String = "What Do We Do With The Drunken Sailor..? Earley In The Morning!" 
var texto_pantalla: String = "..." 

var _velocidad: float = 100.0 #Funciones Privadas d[que sólo queremos usar en]el presente Script por convención se declaran iniciando con "_funcion" [aunque sí pueden llamarse desde otros Scripts].
var _velocidad_salto: float = -300.0 #Funciones Privadas d[que sólo queremos usar en]el presente Script por convención se declaran iniciando con "_funcion" [aunque sí pueden llamarse desde otros Scripts].

#signal personaje_muerto 

@export var animacion: Node # Más específico sería "AnimatedSprite2D", pero el genérico "Node" es más versátil. 
@export var area_2d: Area2D 

func _ready(): 
#	area_2d.body_entered.connect(_on_area_2d_body_entered) 
	
	
	
	#var articulos: int = mochila(rum, grog, pata_pollo) # espada, pistola, llave) 
	#print(articulos) 
	var riqueza = monedero(monedas) 
	print(riqueza) 
	
func race():
	print("READY? 2... 3!")

#func condicional():
	#variable = "X..." #opcionalmente, las variables pueden modificarse desde aquí para la ocasión...
	#if variable == cumple: 
		#print()
	#else: 
		#print()

func salud(vida_1, vida_2, vida_3):
	var corazones: int = vida_1 + vida_2 + vida_3 #variables propietarias de cada Función, sólo pueden usarse dentro de la misma. 
	print(corazones) #return corazones [alternativamente. una Función puede recibir múltiples valores, pero sólo devolver uno]a
	#return finaliza la Función. 

func beber(): 
	#if vidas: int >0 && < 3 
		#var corazones: int ++ 
		#var ebrio: bool = true 
	#else: 
		#print(corazones) 
	pass 

func monedero(item_1):
	var suma = item_1 
	print(suma) #return riqueza [alternativamente. una Función puede recibir múltiples valores, pero sólo devolver uno]a

#func mochila(item_1, item_2, item_3): #, item_4, item_5): -> void / int / bool / array / Vector2 / Array / String: garantiza el Tipo de Dato devuelto. pero arroja conflictos si las rutass no conducen todas al mismo. 
	#var carga_total = item_1 + item_2 + item_3 #+ item_4 + item_5 
	#print(carga_total) #return carga_total [alternativamente. una Función puede recibir múltiples valores, pero sólo devolver uno]a

#Movimiento del Player (Custom) 
#func _process(delta): #Recibe un float llamado "delta" (tiempode de renderizado del Frame previo). Es similar a ready, excepto que se llama constantemente con cada frame, en vez de sólo una vez.
	#position.x += 10 * delta 


func _physics_process(delta): #Se llama 60 times/sec. para sincronizar los Frames con el Motor de Físicas [Ej: empujar cajas, etc.] 

#Gravedad: 
	velocity += get_gravity() * delta 

#Salto: 
	if Input.is_action_just_pressed("saltar") && is_on_floor(): 
		velocity.y = _velocidad_salto 
	# No se requiere un Else a 0 porque la Gravedad ya se ocupa de eso. 
	
#Lateral: [Cuando el Pirata está sobrio, se desplaza normalmente. El Rum le cura PERO al ir ebrio los comandos se invierten, aumentando la Dificultad]
	#if Input.is_action_pressed("izquierda") && ebrio != false: 
		#velocity.x = _velocidad #sin necesidad de multiplicarlo por delta. 
		#animacion.flip_h = true 
	#elif Input.is_action_pressed("derecha"): 
		#velocity.x = -_velocidad #sin necesidad de multiplicarlo por delta. 
		#animacion.flip_h = false 
	#else: 
		#velocity.x = 0  
	#move_and_slide() #resuelve las Colisiones. 
	
	if Input.is_action_pressed("izquierda") && ebrio != true: 
		velocity.x = -_velocidad #sin necesidad de multiplicarlo por delta. 
		animacion.flip_h = true 
	elif Input.is_action_pressed("derecha"): 
		velocity.x = _velocidad #sin necesidad de multiplicarlo por delta. 
		animacion.flip_h = false 
	else: 
		velocity.x = 0  
	move_and_slide() #resuelve las Colisiones. 
	
#Animación: 
	if !is_on_floor(): 
		animacion.play("saltar") 
	elif velocity.x != 0: 
		animacion.play("correr")
	else: 
		animacion.play("idle") 

#Señales: 


#func _on_area_2d_body_entered(_body: Node2D) -> void: 
	#animacion.material = material_personaje_rojo 
	#_muerto = true 
	#animacion.stop() 
	#
	##var timer: Timer = Timer.new() 
	##add_child(timer) 
	##timer.start(0.5) 
	##await timer.timeout 
	#
	#await get_tree().create_timer(0.5).timeout #Alternativamente resume el Timer anterior.
	#personaje_muerto.emit() 
