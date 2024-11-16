extends Node2D


func _ready():
	P1WelcomePopup()


func _process(delta: float) -> void:
	print(%P1.global_position)

func P1WelcomePopup():
	%P1WelcomePanel.popup()
	
func HideP1WelcomePopup():
	%P1WelcomePanel.hide()
