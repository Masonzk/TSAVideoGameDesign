extends RigidBody2D

var start_value = 5
var current_value = 0

func _ready():
	current_value = start_value
	
func _process(delta):
	$Label.text = str(current_value)
	
func destroy():
	$AnimationPlayer.play("destroy")
func _on_Ball_body_entered(body):
	if body.is_in_group("bounce"):
		var formula = body.formula_change
		for i in formula.keys():
			match i:
				"*":
					current_value *= formula[i]
				"+":
					current_value += formula[i]
				"-":
					current_value -= formula[i]
				"/":
					current_value *= (1/formula[i])
		$AnimationPlayer.play("Pulse")
