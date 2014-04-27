class Player extends PhysicsObject
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
		player = new Player world
		player.setPosition 50, 100
		player

	speed: 50
	width: 44
	height: 23
	type: 'player'
	time: 0

	constructor:(@world)->
		@reloading = RELOADING # To avoid shooting immediately

	setMovement:(movement)->
		@setVelocity movement.x * @speed, movement.y * @speed

	constrainToBounds:()->
		@x = max(BOUNDS.left+@width/2, min(BOUNDS.right-@width/2, @x))
		@y = max(BOUNDS.top+@height/2, min(BOUNDS.bottom-@height/2, @y))

	pass:(time)->
		super time
		@time += time
		@constrainToBounds()
		@reloading = max 0, @reloading - time

	shoot:()->
		if not @reloading
			@world.createTorpedo @x, @y, 120, 0
			@reloading = RELOADING
