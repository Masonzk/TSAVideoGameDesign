extends Node2D

export var emit_time : float
export var emit_direction : Vector2
export var emit_speed : float
export var default_value : float

var ball = preload("res://Scenes/Ball.tscn")

func _ready():
	$Timer.wait_time = emit_time
	var angle = ((get_global_position() - emit_direction) - get_global_position()).angle()
	$Sprite.rotation = angle
	#$Sprite.look_at(emit_direction)
	
func _on_Timer_timeout():
	var instance = ball.instance()
	instance.position = get_global_position()
	instance.linear_velocity = emit_direction * emit_speed
	instance.start_value = default_value
	get_parent().add_child(instance)
	$AnimationPlayer.play("Pulse")
