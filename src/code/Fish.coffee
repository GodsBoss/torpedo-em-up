class Fish
	@LIFE = 10
	CHANGE_DIRECTION_INTERVAL = 1

	width: 32
	height: 17
	
	constructor:(@x, @y)->
		@life = Fish.LIFE
		@time = 0
		@vx = 0
		@vy = 0
		@directionTimer = CHANGE_DIRECTION_INTERVAL

	pass:(time)->
		@x += @vx
		@y += @vy
		@time += time
		@directionTimer -= time
		if @directionTimer < 0
			@chooseDirection()
			@directionTimer += CHANGE_DIRECTION_INTERVAL

	chooseDirection:()->
		angle = (Math.random() * Math.PI) + Math.PI
		@vx = Math.sin angle
		@vy = Math.cos angle

	receiveDamage:(damage)->
		@life = Math.max 0, @life - damage

	lives:()->
		@life > 0
