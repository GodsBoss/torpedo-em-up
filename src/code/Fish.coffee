class Fish extends Enemy
	@LIFE = 10
	CHANGE_DIRECTION_INTERVAL = 1

	width: 32
	height: 17
	type: 'fish'
	life: Fish.LIFE
	directionTimer: CHANGE_DIRECTION_INTERVAL
	speed: 20
	points: 5
	bonusChance: 0.04
	
	pass:(time)->
		super time
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
		@setVelocity @speed*Math.sin(angle), @speed*Math.cos(angle)
