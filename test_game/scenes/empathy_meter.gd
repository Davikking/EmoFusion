extends ProgressBar

@onready var meter = %EmpathyMeter

func _process(delta: float) -> void:
	meter.value = 15
