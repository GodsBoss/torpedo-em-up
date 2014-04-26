class Player
	#Shortcuts
	max = Math.max
	min = Math.min

	BOUNDS =
		left: 0
		top: 0
		right: 320
		bottom: 200

	@createDefault = ()->
		player = new Player 44, 23
		player.moveTo 50, 100
		player.speed = 5
		player

	movement:
		x: 0
		y: 0

	constructor:(@width, @height)->
		@x = 0
		@y = 0

	moveTo:(@x, @y)->
		@constrainToBounds()

	setMovement:(@movement)->

	constrainToBounds:()->
		@x = max(BOUNDS.left+@width/2, min(BOUNDS.right-@width/2, @x))
		@y = max(BOUNDS.top+@height/2, min(BOUNDS.bottom-@height/2, @y))

	pass:(time)->
		@moveTo @x + @movement.x * @speed, @y + @movement.y * @speed
