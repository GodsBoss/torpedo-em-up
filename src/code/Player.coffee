class Player
	#Shortcuts
	max = Math.max
	min = Math.min

	BOUNDS =
		left: 0
		top: 0
		right: 320
		bottom: 200

	# Reloading duration in seconds
	RELOADING = 0.5

	@createDefault = (world)->
		player = new Player world, 44, 23
		player.moveTo 50, 100
		player.speed = 5
		player

	movement:
		x: 0
		y: 0

	constructor:(@world, @width, @height)->
		@x = 0
		@y = 0
		@reloading = RELOADING # To avoid shooting immediately

	moveTo:(@x, @y)->
		@constrainToBounds()

	setMovement:(@movement)->

	constrainToBounds:()->
		@x = max(BOUNDS.left+@width/2, min(BOUNDS.right-@width/2, @x))
		@y = max(BOUNDS.top+@height/2, min(BOUNDS.bottom-@height/2, @y))

	pass:(time)->
		@reloading = max 0, @reloading - time
		@moveTo @x + @movement.x * @speed, @y + @movement.y * @speed

	shoot:()->
		if not @reloading
			@world.createTorpedo @x, @y, 5.5, 0
			@reloading = RELOADING
