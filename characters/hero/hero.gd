extends CharacterBody2D

#-------------------------------------------------------------------------------
# Variables
#-------------------------------------------------------------------------------

# Movement speed of this character
@export var speed = 400
func _ready():
	$AnimatedSprite2D.animation = "walk";
	
func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	);
	
	velocity = input_direction * speed;
	
	move_and_slide();
	
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
