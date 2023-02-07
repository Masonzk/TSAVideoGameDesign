extends StaticBody2D

var mouse_in = false
var held = false

export var formula_change : Dictionary
export var visible_formula_change : String

func _ready():
	$Label.text = visible_formula_change
	#$Sprite.modulate = Color(1, 1, rand_range(0, 1), 1)
func _process(delta):
	drag()

func drag():
	if Input.is_action_just_pressed("mouse_left") and mouse_in:
		$CollisionShape2D.disabled = true
		held = true
	if Input.is_action_just_released("mouse_left") and held:
		held = false
	if held:
		position = lerp(position, get_global_mouse_position(), 0.5)
	else:
		if $Area2D.get_overlapping_bodies() == []:
			$CollisionShape2D.disabled = false
		else:
			for body in $Area2D.get_overlapping_bodies():
				if body is RigidBody2D:
					$CollisionShape2D.disabled = true
					
func _on_Area2D_mouse_entered():
	mouse_in = true
	
func _on_Area2D_mouse_exited():
	mouse_in = false
