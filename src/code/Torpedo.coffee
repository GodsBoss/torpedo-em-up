class Torpedo extends PhysicsObject
	width: 14
	height: 5
	strength: 5
	exploded: false
	lifetime: 0

	pass:(time)->
		super time
		@lifetime += time

	explode:()->
		@exploded = true
