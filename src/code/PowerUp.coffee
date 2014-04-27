class PowerUp extends PhysicsObject

	@TYPE_POINTS = 'powerUpPoints'
	@TYPE_HEALTH = 'powerUpHealth'
	@TYPE_TORPEDO = 'powerUpTorpedo'

	vx: -5
	used: false

	@createRandom = (position)->
		powerUp = new PowerUp
		r = Math.random()
		if r > 0.4
			type = PowerUp.TYPE_POINTS
		else if r > 0.1
			type = PowerUp.TYPE_HEALTH
		else
			type = PowerUp.TYPE_TORPEDO
		powerUp.setType type
		powerUp.setPosition position.x, position.y
		powerUp

	setType:(@type)->

	pass:(time)->
		super time
		@vy = Math.sin @time
