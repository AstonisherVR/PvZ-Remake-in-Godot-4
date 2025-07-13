extends Node

@onready var debug_texture := GradientTexture2D.new()

@export var grid_rows: int = 9
@export var grid_columns: int = 5
@export var cell_x_spacing: float = 128.0
@export var cell_y_spacing: float = 160.0
@export var start_x: float = 140.0
@export var start_y: float = 190.0

func _ready() -> void:
	generate_grid_positions(grid_rows, grid_columns, cell_x_spacing, cell_y_spacing, start_x, start_y)
	create_debug_position_points()

func generate_grid_positions(rows: int, columns: int, x_spacing: float, y_spacing: float, offset_x: float, offset_y: float) -> void:
	Globals.grid_positions.resize(rows)
	# Create grid positions
	for row in rows:
		var row_positions: Array
		row_positions.resize(columns)
		for column in columns:
			# Calculate the position for each cell with offsets
			row_positions[column] = Vector2(start_x + row * x_spacing,
											start_y + column * y_spacing)
		Globals.grid_positions[row] = row_positions

func create_debug_position_points() -> void:
	for row: Array in Globals.grid_positions:
		for cell_position: Vector2 in row:
			var debug_position_point := Sprite2D.new()
			debug_position_point.texture = preload("res://icon.svg")
			debug_position_point.self_modulate = Color(1, 1, 1, 0.392)
			debug_position_point.position = cell_position
			add_child(debug_position_point)
