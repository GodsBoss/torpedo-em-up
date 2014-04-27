class Enemy extends PhysicsObject
	receiveDamage:(damage)->
		@life = Math.max 0, @life - damage

	lives:()->
		@life > 0

	getPlayerDamage:()->
		@life

	kill:()->
		@life = 0
