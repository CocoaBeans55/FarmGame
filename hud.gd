extends Node2D

@onready var player = self.get_parent()



func _ready() -> void:
	z_index = 10
	$NightTimeFilter.z_index = 5
	GlobalFarmTileManager.connect("night_started", Callable(self, "setNight"))
	GlobalFarmTileManager.connect("day_started", Callable(self, "setDay"))
	$Control/VBoxContainer/WheatContainer/Count.text = str(player.inventory["wheat"])
	$Control/VBoxContainer/CornContainer/Count.text = str(player.inventory["corn"])
	$Control/VBoxContainer/BambooContainer/Count.text = str(player.inventory["bamboo"])
	$Control/VBoxContainer/BerryContainer/Count.text = str(player.inventory["berry"])
	$Control/VBoxContainer/OnionContainer/Count.text = str(player.inventory["onion"])
	$Control/VBoxContainer/FlowerContainer/Count.text = str(player.inventory["flower"])
	$Control/VBoxContainer/PepperContainer/Count.text = str(player.inventory["pepper"])
	await get_tree().create_timer(0.1).timeout
	updateAllCounterWithoutAnimation()
func updateAllCounterWithoutAnimation():
	$Control/VBoxContainer/WheatContainer/Count.text = str(player.inventory["wheat"])
	$Control/VBoxContainer/CornContainer/Count.text = str(player.inventory["corn"])
	$Control/VBoxContainer/BambooContainer/Count.text = str(player.inventory["bamboo"])
	$Control/VBoxContainer/BerryContainer/Count.text = str(player.inventory["berry"])
	$Control/VBoxContainer/OnionContainer/Count.text = str(player.inventory["onion"])
	$Control/VBoxContainer/FlowerContainer/Count.text = str(player.inventory["flower"])
	$Control/VBoxContainer/PepperContainer/Count.text = str(player.inventory["pepper"])

func _process(_delta: float) -> void:
	$time.text = str(GlobalVars.globalTime)
	$ClockSprite/handSprite.rotation = (GlobalVars.globalTime / 12.0) * TAU
func setNight():
	SoundManager.play_ui_sound("res://sounds/turn_night.mp3",.45)
	$NightTimeFilter/NightFilterAnimationPlayer.play("turn_night")

func setDay():
	SoundManager.play_ui_sound("res://sounds/turn_day.mp3",.45)
	$NightTimeFilter/NightFilterAnimationPlayer.play("turn_day")

func updateAllCounter():
	$Control/VBoxContainer/WheatContainer/Count.text = str(player.inventory["wheat"])
	$Control/VBoxContainer/WheatContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/WheatContainer/AnimationPlayer.play("update")
	$Control/VBoxContainer/CornContainer/Count.text = str(player.inventory["corn"])
	$Control/VBoxContainer/CornContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/CornContainer/AnimationPlayer.play("update")
	$Control/VBoxContainer/BambooContainer/Count.text = str(player.inventory["bamboo"])
	$Control/VBoxContainer/BambooContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/BambooContainer/AnimationPlayer.play("update")
	$Control/VBoxContainer/BerryContainer/Count.text = str(player.inventory["berry"])
	$Control/VBoxContainer/BerryContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/BerryContainer/AnimationPlayer.play("update")
	$Control/VBoxContainer/OnionContainer/Count.text = str(player.inventory["onion"])
	$Control/VBoxContainer/OnionContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/OnionContainer/AnimationPlayer.play("update")
	$Control/VBoxContainer/FlowerContainer/Count.text = str(player.inventory["flower"])
	$Control/VBoxContainer/FlowerContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/FlowerContainer/AnimationPlayer.play("update")
	$Control/VBoxContainer/PepperContainer/Count.text = str(player.inventory["pepper"])
	$Control/VBoxContainer/PepperContainer/AnimationPlayer.stop()
	$Control/VBoxContainer/PepperContainer/AnimationPlayer.play("update")

	
func updateCounter(cropType: String):
	match cropType:
		"wheat":
			$Control/VBoxContainer/WheatContainer/Count.text = str(player.inventory["wheat"])
			$Control/VBoxContainer/WheatContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/WheatContainer/AnimationPlayer.play("update")
		"corn":
			$Control/VBoxContainer/CornContainer/Count.text = str(player.inventory["corn"])
			$Control/VBoxContainer/CornContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/CornContainer/AnimationPlayer.play("update")
		"bamboo":
			$Control/VBoxContainer/BambooContainer/Count.text = str(player.inventory["bamboo"])
			$Control/VBoxContainer/BambooContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/BambooContainer/AnimationPlayer.play("update")
		"berry":
			$Control/VBoxContainer/BerryContainer/Count.text = str(player.inventory["berry"])
			$Control/VBoxContainer/BerryContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/BerryContainer/AnimationPlayer.play("update")
		"onion":
			$Control/VBoxContainer/OnionContainer/Count.text = str(player.inventory["onion"])
			$Control/VBoxContainer/OnionContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/OnionContainer/AnimationPlayer.play("update")
		"flower":
			$Control/VBoxContainer/FlowerContainer/Count.text = str(player.inventory["flower"])
			$Control/VBoxContainer/FlowerContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/FlowerContainer/AnimationPlayer.play("update")
		"pepper":
			$Control/VBoxContainer/PepperContainer/Count.text = str(player.inventory["pepper"])
			$Control/VBoxContainer/PepperContainer/AnimationPlayer.stop()
			$Control/VBoxContainer/PepperContainer/AnimationPlayer.play("update")
		
