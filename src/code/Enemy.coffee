class Enemy extends PhysicsObject
	points: 0
	bonusChance: 0

	receiveDamage:(damage)->
		@life = Math.max 0, @life - damage

	lives:()->
		@life > 0

	getPlayerDamage:()->
		@life

	kill:()->
		@life = 0

	isObsolet:()->
		@x < -50 or not @lives()
