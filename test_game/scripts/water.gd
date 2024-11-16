extends Area2D

# Declare a variable for the slow-down factor
var slow_factor : float = 0.5  # Reduce the speed by 50% when in water

# Signal to detect when player enters and exits the water
signal player_entered_water
signal player_exited_water

# Called when a player enters the water area
func _on_Water_body_entered(body):
	if body.is_in_group("player"):  # Ensure only the player is affected
		body.apply_slowdown(slow_factor)  # Apply slowdown to the player
		emit_signal("player_entered_water")  # Signal that player entered water

# Called when a player exits the water area
func _on_Water_body_exited(body):
	if body.is_in_group("player"):  # Ensure only the player is affected
		body.remove_slowdown()  # Remove slowdown from the player
		emit_signal("player_exited_water")  # Signal that player exited water
