class Torpedo extends PhysicsObject
	width: 14
	height: 5
	strength: 5
	exploded: false
	type: 'torpedo'

	explode:()->
		@exploded = true
