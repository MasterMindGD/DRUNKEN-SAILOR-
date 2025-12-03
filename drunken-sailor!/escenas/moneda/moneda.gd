extends Node2D

@export var area_2d: Area2D 
@export var reproductor: AudioStreamPlayer2D 

var monedero: Monedero  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(_recogida) 
	
	_iniciar_animacion() 

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _recogida(_body): 
	monedero.moneda_recogida() 
	reproductor.reparent(get_parent()) 
	reproductor.play() 
	queue_free() 

func _iniciar_animacion(): 
	var tween: Tween = create_tween() 
	tween.set_loops(0) 
	tween.tween_property(self, "position:y", position.y -10, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)  
	tween.tween_property(self, "position:y", position.y +10, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)  
	
	
