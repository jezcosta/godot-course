class_name Enemy
extends Node2D

@export_category("Life")
@export var health: int = 10
@export var damage_amount: int = 1
@export var death_prefab: PackedScene

@export_category("Drops")
@export var drop_chance: float = 0.1
@export var drop_items: Array[PackedScene]
@export var drop_chances: Array[float] = []

@onready var damage_digit_marker = $DamageDigitMarker

var damage_digit_prefab: PackedScene

func _ready():
	damage_digit_prefab = preload("res://misc/damage_digit.tscn")

func damage(amount: int) -> void:
	health -= amount
	
	animate_damage(amount)
	
	if health <= 0:
		die()
		
func die():
	GameManager.monsters_defeated_counter += 1
	
	if death_prefab:
		var death_object = death_prefab.instantiate()
		death_object.position = position
		get_parent().add_child(death_object)
		
	verify_drop()
	queue_free()

func animate_damage(amount: int):
	modulate = Color.RED
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "modulate", Color.WHITE, 0.3)
	
	if damage_digit_marker:
		var damage_digit = damage_digit_prefab.instantiate()
		damage_digit.value = amount
		damage_digit.global_position = damage_digit_marker.global_position
		get_parent().add_child(damage_digit)

func verify_drop():
	if randf() <= drop_chance:
		var drop = get_random_drop_item().instantiate()
		drop.position = position
		get_parent().add_child(drop)
		
		
func get_random_drop_item():
	if drop_items.size() == 1:
		return drop_items[0]
	
	var max_chance: float = 0.0
	for drop_chance in drop_chances:
		max_chance += drop_chance
	
	var random_value = randf() * max_chance
	var needle: float = 0.0
	for i in drop_items.size():
		var drop_item = drop_items[i]
		var drop_chance = drop_chances[i] if i < drop_chances.size() else 1
		if random_value <= drop_chance + needle:
			return drop_item
		needle += drop_chance
		
	return drop_items[0]
