class Bubbles extends PhysicsObject
	type: 'bubbles'

	width: 9
	height: 11
	vy: -55

	isObsolet:()->
		@y < -20
