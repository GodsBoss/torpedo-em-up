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
		@setPosition @x + @vx, @y + @vy
		@time += time
		@directionTimer -= time
		if @directionTimer < 0
			@chooseDirection()
			@directionTimer += CHANGE_DIRECTION_INTERVAL

	setPosition:(@x, @y)->
		if @y < Math.max @height / 2
			@y = @height / 2
			@chooseDirection()
			@vy = Math.abs @vy
		if @y > Math.min 200 - @height / 2
			@y = 200 - @height / 2
			@chooseDirection()
			@vy = - Math.abs @vy

	chooseDirection:()->
		angle = (Math.random() * Math.PI) + Math.PI
		@vx = Math.sin angle
		@vy = Math.cos angle

	receiveDamage:(damage)->
		@life = Math.max 0, @life - damage

	lives:()->
		@life > 0
