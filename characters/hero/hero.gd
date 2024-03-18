extends CharacterBody2D

#-------------------------------------------------------------------------------
# Variables
#-------------------------------------------------------------------------------

# Movement speed of this character
@export var speed = 400;

#-------------------------------------------------------------------------------
# Engine Functions
#-------------------------------------------------------------------------------
func _ready():
	$AnimatedSprite2D.animation = "idle";
	
func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	);
	
	velocity = input_direction * speed;
	
	move_and_slide();
	move_animation();

#-------------------------------------------------------------------------------
# Behaviour Functions
#-------------------------------------------------------------------------------

func move_animation():
	if velocity.length() > 0:
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "walk-right";
			$AnimatedSprite2D.flip_h = velocity.x < 0;
		elif velocity.y != 0:
			$AnimatedSprite2D.animation = "walk-up";
		$AnimatedSprite2D.play();
	else:
		$AnimatedSprite2D.stop();
