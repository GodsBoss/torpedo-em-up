class PhysicsObject

	# Default values
	x: 0
	y: 0
	vx: 0
	vy: 0
	width: 0
	height: 0

	setPosition:(@x, @y)->

	setVelocity:(@vx, @vy)->

	pass:(time)->
		@setPosition @x + @vx*time, @y + @vy*time
