class Bubble extends PhysicsObject
	type: 'bubble'
	width: 9
	height: 9
	vy: -10

	constructor:()->
		super()
		@offset = Math.PI * 2 * Math.random()

	pass:(time)->
		super time
		@vx = 5 * Math.sin((@time+@offset) / 2)

	isObsolet:()->
		@y < -20
